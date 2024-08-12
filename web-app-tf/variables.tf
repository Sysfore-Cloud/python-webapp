variable "resource_group_name" {
  type    = string
  default = "rsg-appservice"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "app_service_plan_name" {
  type    = string
  default = "plan-appservice"
}

variable "app_service_name" {
  type    = string
  default = "appservice-pythonapp"
}
