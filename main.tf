terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.109.0"
    }
  }
}

provider "azurerm" {
 features {
   
 }
}

resource "azurerm_resource_group" "tf-rg" {
  name     = "jenkins-rg"
  location = "West Europe"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "RG-Storage"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "addsstoragescript"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "terraform-tffiles"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}