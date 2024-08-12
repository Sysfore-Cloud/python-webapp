
# STEP 1 PACKAGE REQUIRED

[Az cli] - to create storage account and blob container to store terraform state file.
[Terraform cli] - TO run terraform Script to create Required azure resources.

# STEP 2 Create azure storage account and blob container for terraform state file.

[Define Variables]
rsg_name="ash-tf-st-eastus"
stg_acc_name="stgaccount35234654"
container_name="tfstate"

[Create resource-group]
az group create --name $rsg_name --location "East US"

[Create storage-account]
az storage account create --name $stg_acc_name --resource-group $rsg_name --location "East US" --sku Standard_LRS

[Create blob-container]
az storage container create --name $container_name --account-name $stg_acc_name

# STEP 3 Terraform files for WEbapp Creation

ALL terraform realted files are in web-app-tf folder, update the necessary variable changes in required file. And then run the below commands to execute terraform.
- terraform init     - to intialize the terraform directory
- terraform validate  - to check arguments/syntax error
- terraform apply  - to create resources


# STEP 4 Deploy a Python (Flask) web app to Azure App Service - Sample Application

This is the sample Flask application for the Azure Quickstart [Deploy a Python (Django or Flask) web app to Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/quickstart-python). For instructions on how to create the Azure resources and deploy the application to Azure, refer to the Quickstart article.

[Make necessary changes to code]

# STEP 5 Configure a automation pipeline for the CI/CD process

Created  workflow will build and push a Python application to an Azure Web App when a commit is pushed to your default branch.

[To configure action workflow:]
- Download the Publish Profile for your Azure Web App.
- Create a secret in your repository named AZURE_WEBAPP_PUBLISH_PROFILE
- Change the value for the AZURE_WEBAPP_NAME. Optionally, change the PYTHON_VERSION environment variables


