provider "azurerm" {
    features {}
}

module "rg-dev" {
    source = "../../module/resource_group"
    name = "rg-dev"
    location = var.location
}

module "vnet-dev" {
    source = "../../module/virtual_network"
    name = "vnet-dev"
    location = module.rg-dev.rg_location
    rg_name = module.rg-dev.rg_name
    address_space = ["10.0.0.0/16"]
}

