resource azurerm_managed_redis "this" {
    name = var.name
    resource_group_name = var.rg_name
    location = var.location
    sku_name = var.sku_name
}