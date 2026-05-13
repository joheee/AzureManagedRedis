provider "azurerm" {
    features {}
}

module "rg" {
    source = "../../module/resource_group"
    name = "rg-dev"
    location = var.location
}