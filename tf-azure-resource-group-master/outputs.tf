output "resource_group_id" {
  description = "The ID of the provisioned resource group"
  value       = var.rg_count >= 1 ? azurerm_resource_group.resource_group[0].id : ""
}

output "resource_group_name" {
  description = "The Name of the provisioned resource group"
  value       = var.rg_count >= 1 ? azurerm_resource_group.resource_group[0].name : ""
}

output "resource_group_location" {
  description = "The Location of the provisioned resource group"
  value       = var.rg_count >= 1 ? azurerm_resource_group.resource_group[0].location : ""
}

output "rg" {
  description = "The resource group module"
  value       = azurerm_resource_group.resource_group
}

output "role_assignment_id" {
  description = "The ID of the role assignment"
  value       = var.create_aad == true && var.rg_count >= 1 ? azurerm_role_assignment.aadcontributorsgroup-association.0.id : ""
}

output "azure_ad_contributor_group_name" {
  description = "The name of the AAD Contributor Group"
  value       = var.create_aad == true && var.rg_count >= 1 ? azuread_group.aadcontributorsgroup.0.name : ""
}

output "azure_ad_contributor_group_id" {
  description = "The ID of the AAD Contributor Group"
  value       = var.create_aad == true && var.rg_count >= 1 ? azuread_group.aadcontributorsgroup.0.id : ""
}

output "azure_ad_readers_group_name" {
  description = "The name of the AAD Readers Group"
  value       = var.create_aad == true && var.rg_count >= 1 ? azuread_group.aadreadersgroup.0.name : ""
}

output "azure_ad_readers_group_id" {
  description = "The ID of the AAD Readers Group"
  value       =  var.create_aad == true && var.rg_count >= 1 ? azuread_group.aadreadersgroup.0.id : ""
}
