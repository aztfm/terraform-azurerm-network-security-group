output "id" {
  value       = azurerm_network_security_group.nsg.id
  description = "The network security group configuration ID."
}

output "name" {
  value       = azurerm_network_security_group.nsg.name
  description = "The name of the network security group."
}

output "resource_group_name" {
  value       = azurerm_network_security_group.nsg.resource_group_name
  description = "The name of the resource group in which to create the network security group."
}

output "location" {
  value       = azurerm_network_security_group.nsg.location
  description = "The location/region where the network security group is created."
}

output "tags" {
  value       = azurerm_network_security_group.nsg.tags
  description = "The tags assigned to the resource."
}

output "inbound_rules" {
  value       = { for rule in azurerm_network_security_rule.inbounds : rule.name => rule }
  description = "Blocks containing configuration of each inbound security rule."
  # module.MODULE_NAME.inbound_rules["INBOUND_RULE_NAME"].id
}

output "outbound_rules" {
  value       = { for rule in azurerm_network_security_rule.outbounds : rule.name => rule }
  description = "Blocks containing configuration of each outbound security rule."
  # module.MODULE_NAME.outbound_rules["OUTBOUND_RULE_NAME"].id
}
