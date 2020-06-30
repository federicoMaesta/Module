data "azuread_user" "contributors" {
  count               = length(var.users_contributors)
  user_principal_name = element(var.users_contributors, count.index)
}

data "azuread_user" "readers" {
  count               = length(var.users_readers)
  user_principal_name = element(var.users_readers, count.index)
}
