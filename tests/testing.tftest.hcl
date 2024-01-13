provider "azurerm" {
  features {}
}

run "setup" {
  module {
    source = "./tests/environment"
  }
}

run "plan" {
  command = plan

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
    location            = run.setup.resource_group_location
  }

  assert {
    condition     = azurerm_network_security_group.nsg.name == run.setup.workspace_id
    error_message = "The network security group name input variable is being modified."
  }

  assert {
    condition     = azurerm_network_security_group.nsg.resource_group_name == run.setup.resource_group_name
    error_message = "The network security group resource group input variable is being modified."
  }

  assert {
    condition     = azurerm_network_security_group.nsg.location == run.setup.resource_group_location
    error_message = "The network security group location input variable is being modified."
  }
}

run "apply" {
  command = apply

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
    location            = run.setup.resource_group_location
  }
}
