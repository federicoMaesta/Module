resource "azuread_group" "aadcontributorsgroup" {
  count  = var.create_aad == true && var.rg_count >= 1 ? 1 : 0
  name   = "${local.resource_identifier}-rg-contributors"
  owners = var.owners
}

resource "azurerm_role_assignment" "aadcontributorsgroup-association" {
  count                = var.create_aad == true && var.rg_count >= 1 ? 1 : 0
  scope                = azurerm_resource_group.resource_group[count.index].id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.aadcontributorsgroup.0.id
}

resource "azuread_group" "aadreadersgroup" {
  count  = var.create_aad == true && var.rg_count >= 1 ? 1 : 0
  name   = "${local.resource_identifier}-rg-readers"
  owners = var.owners
}

resource "azurerm_role_assignment" "aadreadersgroup-association" {
  count                = var.create_aad == true && var.rg_count >= 1 ? 1 : 0
  scope                = azurerm_resource_group.resource_group[count.index].id
  role_definition_name = "Reader"
  principal_id         = azuread_group.aadreadersgroup.0.id
}

resource "azuread_group_member" "contributor" {
  count            = var.create_aad == true && var.rg_count >= 1 ? length(var.users_contributors) : 0
  group_object_id  = azuread_group.aadcontributorsgroup.0.id
  member_object_id = data.azuread_user.contributors[count.index].id
}

resource "azuread_group_member" "reader" {
  count            = var.create_aad == true && var.rg_count >= 1 ? length(var.users_readers) : 0
  group_object_id  = azuread_group.aadreadersgroup.0.id
  member_object_id = data.azuread_user.readers[count.index].id
}
