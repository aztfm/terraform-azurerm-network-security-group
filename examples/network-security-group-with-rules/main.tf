resource "azurerm_resource_group" "rg" {
  name     = "resource-group"
  location = "West Europe"
}

module "network_security_group" {
  source              = "aztfm/network-security-group/azurerm"
  version             = ">=1.0.0"
  name                = "network-security-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  inbound_rules = [
    {
      name                       = "inbound_rule_1"
      priority                   = 100
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefix      = "10.10.10.10"
      destination_address_prefix = "10.10.10.10"
      description                = "inbound_rule_1"
    },
    {
      name                   = "inbound_rule_2"
      priority               = 200
      access                 = "Deny"
      protocol               = "Udp"
      source_address_prefix  = "20.20.20.20"
      destination_port_range = 22
      description            = "inbound_rule_2"
    }
  ]
  outbound_rules = [
    {
      name                       = "outbound_rule_1"
      priority                   = 100
      access                     = "Allow"
      protocol                   = "Icmp"
      source_port_range          = 80
      destination_address_prefix = "10.10.10.10"
      description                = "outbound_rule_1"
    },
    {
      name                   = "outbound_rule_2"
      priority               = 200
      access                 = "Deny"
      protocol               = "*"
      source_port_range      = 443
      destination_port_range = 3389
      description            = "outbound_rule_2"
    }
  ]
}
