<!-- markdownlint-disable MD013 -->
# Azure Network Security Group - Terraform Module

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)
[![Terraform Registry](https://img.shields.io/badge/Terraform-registry-blueviolet.svg?logo=terraform)](https://registry.terraform.io/modules/aztfm/network-security-group/azurerm/)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/aztfm/terraform-azurerm-network-security-group?label=Release)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/aztfm/terraform-azurerm-network-security-group?quickstart=1)

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 2.x.x       | >= 1.3.x          | >= 2.0.0        |
| >= 1.x.x       | >= 0.13.x         | >= 2.0.0        |

<!-- BEGIN_TF_DOCS -->
## Parameters

The following parameters are supported:

| Name | Description | Type | Default | Required |
| ---- | ----------- | :--: | :-----: | :------: |
|name|The name of the network security group.|`string`|n/a|yes|
|resource\_group\_name|The name of the resource group in which to create the network security group.|`string`|n/a|yes|
|location|The location/region where the network security group is created.|`string`|n/a|yes|
|tags|A mapping of tags to assign to the resource.|`map(string)`|`{}`|no|
|inbound\_rules|List of objects that represent the configuration of each inbound rule.|`list(object({}))`|`[]`|no|
|outbound\_rules|List of objects that represent the configuration of each outbound rule.|`list(object({}))`|`[]`|no|

The `inbound_rules` and `outbound_rules` supports the following:

| Name | Description | Type | Default | Required |
| ---- | ------------| :--: | :-----: | :------: |
|name|The name of the network security rule.|`string`|n/a|yes|
|priority|The value can be between `100` and `65500`. The priority number must be unique for each rule in the collection.|`number`|n/a|yes|
|access|Specifies whether network traffic is allowed or denied. Possible values are `Allow` and `Deny`.|`string`|n/a|yes|
|protocol|Network protocol this rule applies to. Possible values include `Tcp`, `Udp`, `Icmp`, or `*` (which matches all).|`string`|n/a|yes|
|source\_address\_prefix|CIDR or source IP range or `*` to match any IP. Tags such as `VirtualNetwork`, `AzureLoadBalancer` and `Internet` can also be used. This is required if `source_address_prefixes` is not specified.|`string`|`null`|no|
|source\_address\_prefixes|List of source address prefixes. Tags may not be used. This is required if `source_address_prefix` is not specified.|`list(string)`|`null`|no|
|source\_application\_security\_group\_ids|A List of source Application Security Group IDs.|`list(string)`|`null`|no|
|source\_port\_range|Source Port or Range. Integer or range between `0` and `65535` or `*` to match any. This is required if `source_port_ranges` is not specified.|`string`|`null`|no|
|source\_port\_ranges|List of source ports or port ranges. This is required if `source_port_range` is not specified.|`list(string)`|`null`|no|
|destination\_address\_prefix|CIDR or destination IP range or `*` to match any IP. Tags such as `VirtualNetwork`, `AzureLoadBalancer` and `Internet` can also be used. This is required if `destination_address_prefixes` is not specified.|`string`|`null`|no|
|destination\_address\_prefixes|List of destination address prefixes. Tags may not be used. This is required if `destination_address_prefix` is not specified.|`list(string)`|`null`|no|
|destination\_application\_security\_group\_ids|A List of destination Application Security Group IDs.|`list(string)`|`null`|no|
|destination\_port\_range|Destination Port or Range. Integer or range between `0` and `65535` or `*` to match any. This is required if `destination_port_ranges` is not specified.|`string`|`null`|no|
|destination\_port\_ranges|List of destination ports or port ranges. This is required if `destination_port_range` is not specified.|`list(string)`|`null`|no|
|description|A description for this rule. Restricted to 140 characters.|`string`|`null`|no|

## Outputs

The following outputs are exported:

| Name | Description | Sensitive |
| ---- | ------------| :-------: |
|id|The network security group configuration ID.|no|
|name|The name of the network security group.|no|
|resource_group_name|The name of the resource group in which to create the network security group.|no|
|location|The location/region where the network security group is created.|no|
|tags|The tags assigned to the resource.|no|
|inbound_rules|Blocks containing configuration of each inbound security rule.|no|
|outbound_rules|Blocks containing configuration of each outbound security rule.|no|
<!-- END_TF_DOCS -->
