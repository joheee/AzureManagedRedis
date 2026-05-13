terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.72.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
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

module "subnet-app-dev" {
    source = "../../module/subnet"
    name = "subnet-app-dev"
    rg_name = module.rg-dev.rg_name
    vnet_name = module.vnet-dev.vnet_name
    address_prefixes = ["10.0.1.0/24"]
}

module "subnet-redis-dev" {
    source = "../../module/subnet"
    name = "subnet-redis-dev"
    rg_name = module.rg-dev.rg_name
    vnet_name = module.vnet-dev.vnet_name
    address_prefixes = ["10.0.1.0/24"]
}

module "managed-redis-dev" {
  source = "../../module/managed_redis"
  name = "redis-dev"
  rg_name = module.rg-dev.rg_name
  location = module.rg-dev.rg_location
  sku_name = "Balanced_B2"
}

module "private-endpoint-redis-dev" {
  source = "../../module/private_endpoint"
  name = "pe-redis-dev"
  rg_name = module.rg-dev.rg_name
  location = module.rg-dev.rg_location 
  subnet_id = module.subnet-redis-dev.subnet_id
  psc_name = "psc-redis-dev"
  psc_resource_id = module.subnet-app-dev.subnet_id
  psc_is_manual_connection = false
  psc_subresource_names = ["redis-dev"]
}