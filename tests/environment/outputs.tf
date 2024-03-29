output "workspace_id" {
  value = local.workspace_id
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "application_security_group_id" {
  value = azurerm_application_security_group.asg.id
}
