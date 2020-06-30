terraform {
  required_version = "< 0.13.0"
}

provider "azurerm" {
  version = "~> 1.44.0"
}

module "test01_rg" {
  source              = "git::https://gitlab.com/claranet-pcp/terraform/azure/tf-azure-resource-group?ref=v1.1.1"
  resource_identifier = "test01"
  location            = var.location
  tags                = var.tags
}

variable location {
  default = "UK South"
}

variable tags {
  default = {
    Environment = "module_test"
    Source      = "DevOps"
  }
}

variable module_version {
    default = ""
}

