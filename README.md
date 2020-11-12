# Azure Network Security Group - Terraform Module
![Testing module](https://github.com/aztfm/terraform-azurerm-network-security-group/workflows/Testing%20module/badge.svg?branch=main)
[![TF Registry](https://img.shields.io/badge/terraform-registry-blueviolet.svg)](https://registry.terraform.io/modules/aztfm/network-security-group/azurerm/)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/aztfm/terraform-azurerm-network-security-group)

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 1.x.x       | >= 0.13.x         | >= 2.0.0        |

## Parameters

The following parameters are supported:

| Name                  | Description                                                            |        Type         | Default | Required |
| --------------------- | ---------------------------------------------------------------------- | :-----------------: | :-----: | :------: |
| name                  | The name of the network security group.                                |      `string`       |   n/a   |   yes    |
| resource\_group\_name | The name of the resource group in which to create the virtual network. |      `string`       |   n/a   |   yes    |
| location              | The location/region where the virtual network is created.              |      `string`       |   n/a   |   yes    |
| inbound\_rules        | List of objects representing inbound rules.                            | `list(map(string))` |  `[]`   |    no    |
| outbound\_rules       | List of objects representing outbound rules.                           | `list(map(string))` |  `[]`   |    no    |
| tags                  | A mapping of tags to assign to the resource.                           |    `map(string)`    |  `{}`   |    no    |

##
The `inbound_rules` and `outbound_rules` supports the following:

| Name                         | Description                                                                                                 |   Type   | Default | Required |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------- | :------: | :-----: | :------: |
| name                         | The name of the subnet.                                                                                     | `string` |   n/a   |   yes    |
| priority                     | The value can be between 100 and 65500. The priority number must be unique for each rule in the collection. | `number` |   n/a   |   yes    |
| access                       | Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny                  | `string` |   n/a   |   yes    |
| protocol                     | Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, or * (which matches all).    | `string` |   n/a   |   yes    |
| source\_address\_prefix      | CIDR or source IP range or * to match any IP.                                                               | `string` |   n/a   |   yes    |
| source\_port\_range          | Source Port or Range. Integer or range between `0` and `65535` or `*` to match any.                         | `number` |   n/a   |   yes    |
| destination\_address\_prefix | CIDR or destination IP range or * to match any IP.                                                          | `string` |   n/a   |   yes    |
| destination\_port\_range     | Destination Port or Range. Integer or range between `0` and `65535` or `*` to match any.                    | `number` |   n/a   |   yes    |
| description                  | A description for this rule. Restricted to 140 characters.                                                  | `string` |   n/a   |   yes    |

## Outputs

The following outputs are exported:

| Name                  | Description                                                                   |
| --------------------- | ----------------------------------------------------------------------------- |
| id                    | The network security group configuration ID.                                  |
| name                  | The name of the network security group.                                       |
| resource\_group\_name | The name of the resource group in which to create the network security group. |
| location              | The location/region where the network security group is created.              |
| inbound\_rules        | Blocks containing configuration of each inbound security rule.                |
| outbound\_rules       | Blocks containing configuration of each outbound security rule.               |
| tags                  | The tags assigned to the resource.                                            |
