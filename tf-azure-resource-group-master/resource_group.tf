resource "azurerm_resource_group" "resource_group" {
  count    = var.rg_count
  name     = var.name_override == null ? "rg-${local.resource_identifier}" : var.name_override
  location = var.location
  tags     = var.tags
}


