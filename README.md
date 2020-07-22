# terraform-polkadot-azure-api-lb

[![open-issues](https://img.shields.io/github/issues-raw/insight-w3f/terraform-polkadot-azure-api-lb?style=for-the-badge)](https://github.com/insight-w3f/terraform-polkadot-azure-api-lb/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-w3f/terraform-polkadot-azure-api-lb?style=for-the-badge)](https://github.com/insight-w3f/terraform-polkadot-azure-api-lb/pulls)
[![build-status](https://circleci.com/gh/insight-w3f/terraform-polkadot-azure-api-lb.svg?style=svg)](https://circleci.com/gh/insight-w3f/terraform-polkadot-azure-api-lb)

## Features

This module creates the necessary infrastructure for a load balanced endpoint for Polkadot nodes running on Azure.

## Terraform Versions

For Terraform v0.12.0+

## Usage

```
resource "azurerm_resource_group" "this" {
  location = "eastus"
  name     = "resource-group-name"
}

module "this" {
  source = "github.com/insight-w3f/terraform-polkadot-azure-api-lb"
  azure_resource_group_name = azurerm_resource_group.this.name   
}
```
## Examples

- [defaults](https://github.com/insight-w3f/terraform-polkadot-azure-api-lb/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| azure\_resource\_group\_name | Name of Azure Resource Group | `string` | n/a | yes |
| network\_name | The network name, ie kusama / mainnet | `string` | `""` | no |
| region | The Azure region to deploy in | `string` | `"eastus"` | no |
| subnet\_id | Subnet ID to deploy load balancer into | `string` | `""` | no |
| tags | Tags in the form of key value pairs to associate with resources | `map(string)` | `{}` | no |
| use\_external\_lb | Bool to switch between public (true) or private (false) | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| lb\_backend\_pool\_id | n/a |
| lb\_endpoint\_ip | n/a |
| lb\_frontend\_ip\_config\_name | n/a |
| lb\_health\_probe\_id | n/a |
| lb\_id | n/a |
| lb\_rpc\_rule\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [Richard Mah](https://github.com/shinyfoil)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.