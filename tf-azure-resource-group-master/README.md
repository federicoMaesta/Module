## Resource Group

v1.0.0 - Major version updated

- Terraform 0.12 compatible
- moved building of tags outside the module

The resource group module provisions a resoruce group with the mandatory tags and an azure active directory group assigned as a contributor.

In order to use this module, the consuming terraform must define both an azurerm provider and an azuread provider.

The Resource group module takes 4 variables

- `resource_identifier` - The standard naming convention for resources from your root module
- `location` - This should be a valid Azure region such as `northeurope` valid regions can be obtained by running the Get-AzureLocation powershell cmdlet.
- `tags` - a map of tag values
- `users_readers` - a list of email addresses for users that require reader access
- `users_contributors` - a list of email addresses for users that require contributor access

The module outputs the following

- `resource_group_id` - The ID of the provisioned resource group
- `resource_group_name` - This is the name of the provisioned resource group
- `resource_group_location` - This is the Azure region the resource group was created in
- `role_assignment_id` - The ID of the rbac role assignment
- `azure_ad_contributor_group_name` - The name of the AAD Contributor Group
- `azure_ad_contributor_group_id` - The ID of the AAD Contributor Group
- `azure_ad_readers_group_name` - The name of the AAD Readers Group
- `azure_ad_readers_group_id` - The ID of the AAD Readers Group

## Example Useage

```hcl
module "resource_group" {
  source              = "git::https://gitlab.com/claranet-pcp/terraform/azure/tf-azure-resource-group/_git/tf-azure-resource-group?ref=v1.0.0"
  resource_identifier = local.resource_identifier
  location            = "northeurope"
  tags                = local.standard_tags
  users_readers       = ["a.user@domain.com","another.user@domain.com"]
  users_contributors  = ["a.developer@domain.com","another.developer@domain.com"]
}
```
