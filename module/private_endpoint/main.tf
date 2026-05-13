resource "azurerm_private_endpoint" "this" {
    name = var.name
    resource_group_name = var.rg_name
    location = var.location
    subnet_id = var.subnet_id
    private_service_connection {
      name = var.psc_name
      private_connection_resource_id = var.psc_resource_id
      is_manual_connection = var.psc_is_manual_connection
      subresource_names = var.psc_subresource_names
    }
}