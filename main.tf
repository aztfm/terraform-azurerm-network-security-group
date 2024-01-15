resource "azurerm_network_security_group" "nsg" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_network_security_rule" "inbounds" {
  for_each                                   = { for rule in var.inbound_rules : rule.name => rule }
  resource_group_name                        = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name                = azurerm_network_security_group.nsg.name
  direction                                  = "Inbound"
  name                                       = each.value.name
  priority                                   = each.value.priority
  access                                     = each.value.access
  protocol                                   = each.value.protocol
  source_address_prefix                      = each.value.source_address_prefix
  source_address_prefixes                    = each.value.source_address_prefixes
  source_application_security_group_ids      = each.value.source_application_security_group_ids
  source_port_range                          = each.value.source_port_range
  source_port_ranges                         = each.value.source_port_ranges
  destination_address_prefix                 = each.value.destination_address_prefix
  destination_address_prefixes               = each.value.destination_address_prefixes
  destination_application_security_group_ids = each.value.destination_application_security_group_ids
  destination_port_range                     = each.value.destination_port_range
  destination_port_ranges                    = each.value.destination_port_ranges
  description                                = each.value.description
}

resource "azurerm_network_security_rule" "outbounds" {
  for_each                                   = { for rule in var.outbound_rules : rule.name => rule }
  resource_group_name                        = azurerm_network_security_group.nsg.resource_group_name
  network_security_group_name                = azurerm_network_security_group.nsg.name
  direction                                  = "Outbound"
  name                                       = each.value.name
  priority                                   = each.value.priority
  access                                     = each.value.access
  protocol                                   = each.value.protocol
  source_address_prefix                      = each.value.source_address_prefix
  source_address_prefixes                    = each.value.source_address_prefixes
  source_application_security_group_ids      = each.value.source_application_security_group_ids
  source_port_range                          = each.value.source_port_range
  source_port_ranges                         = each.value.source_port_ranges
  destination_address_prefix                 = each.value.destination_address_prefix
  destination_address_prefixes               = each.value.destination_address_prefixes
  destination_application_security_group_ids = each.value.destination_application_security_group_ids
  destination_port_range                     = each.value.destination_port_range
  destination_port_ranges                    = each.value.destination_port_ranges
  description                                = each.value.description
}
