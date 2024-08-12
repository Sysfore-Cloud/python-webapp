terraform {
  backend "azurerm" {
    resource_group_name   = "ash-tf-st-eastus"
    storage_account_name  = "stgaccount35234654" 
    container_name        = "tfstate"
    key                   = "webapp.tfstate"
  }
}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "F1"
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id = azurerm_service_plan.asp.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
     application_stack {
       python_version = "3.8"
     }
     always_on = false
  }
}

resource "azurerm_role_assignment" "app_service_contributor" {
  principal_id   = azurerm_linux_web_app.app.identity[0].principal_id
  role_definition_name = "Contributor"
  scope = azurerm_resource_group.rg.id
}



output "app_service_url" {
  value = azurerm_linux_web_app.app.default_hostname
}

