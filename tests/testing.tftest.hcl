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
    inbound_rules = [{
      name                                       = "InboundRule1"
      priority                                   = 100
      access                                     = "Allow"
      protocol                                   = "Tcp"
      source_address_prefix                      = "10.0.1.0/24"
      source_port_ranges                         = ["80", "443"]
      destination_application_security_group_ids = [run.setup.application_security_group_id]
      destination_port_range                     = "3389"
      description                                = "This is a rule."
      }, {
      name                                  = "InboundRule2"
      priority                              = 200
      access                                = "Deny"
      protocol                              = "Udp"
      source_application_security_group_ids = [run.setup.application_security_group_id]
      source_port_range                     = "*"
      destination_address_prefixes          = ["10.0.2.0/25", "10.0.2.128/25"]
      destination_port_range                = "443"
      }, {
      name                       = "InboundRule3"
      priority                   = 300
      access                     = "Allow"
      protocol                   = "Icmp"
      source_address_prefixes    = ["10.0.3.0/25", "10.0.3.128/25"]
      source_port_range          = "1443"
      destination_address_prefix = "10.0.0.0/24"
      destination_port_ranges    = ["80", "443"]
    }]
    outbound_rules = [{
      name                                       = "OutboundRule1"
      priority                                   = 100
      access                                     = "Deny"
      protocol                                   = "Esp"
      source_address_prefix                      = "10.0.1.0/24"
      source_port_ranges                         = ["80", "443"]
      destination_application_security_group_ids = [run.setup.application_security_group_id]
      destination_port_range                     = "3389"
      description                                = "This is a rule."
      }, {
      name                                  = "OutboundRule2"
      priority                              = 200
      access                                = "Allow"
      protocol                              = "Ah"
      source_application_security_group_ids = [run.setup.application_security_group_id]
      source_port_range                     = "*"
      destination_address_prefixes          = ["10.0.2.0/25", "10.0.2.128/25"]
      destination_port_range                = "443"
      }, {
      name                       = "OutboundRule3"
      priority                   = 300
      access                     = "Deny"
      protocol                   = "*"
      source_address_prefixes    = ["10.0.3.0/25", "10.0.3.128/25"]
      source_port_range          = "1443"
      destination_address_prefix = "10.0.0.0/24"
      destination_port_ranges    = ["80", "443"]
    }]
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

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule1"].name == "InboundRule1"
    error_message = "The InboundRule1 name is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule1"].priority == 100
    error_message = "The InboundRule1 priority is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule1"].access == "Allow"
    error_message = "The InboundRule1 access is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule1"].protocol == "Tcp"
    error_message = "The InboundRule1 protocol is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule1"].source_address_prefix == "10.0.1.0/24"
    error_message = "The source address prefix of InboundRule1 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule1"].source_port_ranges == toset(["80", "443"])
    error_message = "The source port ranges of InboundRule1 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule1"].destination_application_security_group_ids == toset([run.setup.application_security_group_id])
    error_message = "The destination application security group ids of InboundRule1 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule1"].destination_port_range == "3389"
    error_message = "The destination port range of InboundRule1 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule1"].description == "This is a rule."
    error_message = "The InboundRule1 description is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule2"].name == "InboundRule2"
    error_message = "The InboundRule2 name is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule2"].priority == 200
    error_message = "The InboundRule2 priority is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule2"].access == "Deny"
    error_message = "The InboundRule2 access is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule2"].protocol == "Udp"
    error_message = "The InboundRule2 protocol is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule2"].source_application_security_group_ids == toset([run.setup.application_security_group_id])
    error_message = "The source application security group ids of InboundRule2 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule2"].source_port_range == "*"
    error_message = "The source port range of InboundRule2 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule2"].destination_address_prefixes == toset(["10.0.2.0/25", "10.0.2.128/25"])
    error_message = "The destination address prefixes of InboundRule2 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule2"].destination_port_range == "443"
    error_message = "The destination port range of InboundRule2 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule2"].description == null
    error_message = "The InboundRule2 description is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule3"].name == "InboundRule3"
    error_message = "The InboundRule3 name is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule3"].priority == 300
    error_message = "The InboundRule3 priority is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule3"].access == "Allow"
    error_message = "The InboundRule3 access is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule3"].protocol == "Icmp"
    error_message = "The InboundRule3 protocol is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule3"].source_address_prefixes == toset(["10.0.3.0/25", "10.0.3.128/25"])
    error_message = "The source address prefixes of InboundRule3 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule3"].source_port_range == "1443"
    error_message = "The source port range of InboundRule3 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule3"].destination_address_prefix == "10.0.0.0/24"
    error_message = "The destination address prefix ids of InboundRule3 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule3"].destination_port_ranges == toset(["80", "443"])
    error_message = "The destination port range of InboundRule3 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.inbounds["InboundRule3"].description == null
    error_message = "The InboundRule1 description is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule1"].name == "OutboundRule1"
    error_message = "The OutboundRule1 name is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule1"].priority == 100
    error_message = "The OutboundRule1 priority is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule1"].access == "Deny"
    error_message = "The OutboundRule1 access is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule1"].protocol == "Esp"
    error_message = "The OutboundRule1 protocol is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule1"].source_address_prefix == "10.0.1.0/24"
    error_message = "The source address prefix of OutboundRule1 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule1"].source_port_ranges == toset(["80", "443"])
    error_message = "The source port ranges of OutboundRule1 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule1"].destination_application_security_group_ids == toset([run.setup.application_security_group_id])
    error_message = "The destination application security group ids of OutboundRule1 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule1"].destination_port_range == "3389"
    error_message = "The destination port range of OutboundRule1 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule1"].description == "This is a rule."
    error_message = "The OutboundRule1 description is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule2"].name == "OutboundRule2"
    error_message = "The OutboundRule2 name is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule2"].priority == 200
    error_message = "The OutboundRule2 priority is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule2"].access == "Allow"
    error_message = "The OutboundRule2 access is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule2"].protocol == "Ah"
    error_message = "The OutboundRule2 protocol is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule2"].source_application_security_group_ids == toset([run.setup.application_security_group_id])
    error_message = "The source application security group ids of OutboundRule2 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule2"].source_port_range == "*"
    error_message = "The source port range of OutboundRule2 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule2"].destination_address_prefixes == toset(["10.0.2.0/25", "10.0.2.128/25"])
    error_message = "The destination address prefixes of OutboundRule2 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule2"].destination_port_range == "443"
    error_message = "The destination port range of OutboundRule2 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule2"].description == null
    error_message = "The OutboundRule2 description is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule3"].name == "OutboundRule3"
    error_message = "The OutboundRule3 name is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule3"].priority == 300
    error_message = "The OutboundRule3 priority is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule3"].access == "Deny"
    error_message = "The OutboundRule3 access is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule3"].protocol == "*"
    error_message = "The OutboundRule3 protocol is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule3"].source_address_prefixes == toset(["10.0.3.0/25", "10.0.3.128/25"])
    error_message = "The source address prefixes of OutboundRule3 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule3"].source_port_range == "1443"
    error_message = "The source port range of OutboundRule3 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule3"].destination_address_prefix == "10.0.0.0/24"
    error_message = "The destination address prefix ids of OutboundRule3 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule3"].destination_port_ranges == toset(["80", "443"])
    error_message = "The destination port range of OutboundRule3 is being modified."
  }

  assert {
    condition     = azurerm_network_security_rule.outbounds["OutboundRule3"].description == null
    error_message = "The OutboundRule3 description is being modified."
  }
}

run "apply" {
  command = apply

  variables {
    name                = run.setup.workspace_id
    resource_group_name = run.setup.resource_group_name
    location            = run.setup.resource_group_location
    inbound_rules = [{
      name                                       = "InboundRule1"
      priority                                   = 100
      access                                     = "Allow"
      protocol                                   = "Tcp"
      source_address_prefix                      = "10.0.1.0/24"
      source_port_ranges                         = ["80", "443"]
      destination_application_security_group_ids = [run.setup.application_security_group_id]
      destination_port_range                     = "3389"
      description                                = "This is a rule."
      }, {
      name                                  = "InboundRule2"
      priority                              = 200
      access                                = "Deny"
      protocol                              = "Udp"
      source_application_security_group_ids = [run.setup.application_security_group_id]
      source_port_range                     = "*"
      destination_address_prefixes          = ["10.0.2.0/25", "10.0.2.128/25"]
      destination_port_range                = "443"
      }, {
      name                       = "InboundRule3"
      priority                   = 300
      access                     = "Allow"
      protocol                   = "Icmp"
      source_address_prefixes    = ["10.0.3.0/25", "10.0.3.128/25"]
      source_port_range          = "1443"
      destination_address_prefix = "10.0.0.0/24"
      destination_port_ranges    = ["80", "443"]
    }]
    outbound_rules = [{
      name                                       = "OutboundRule1"
      priority                                   = 100
      access                                     = "Deny"
      protocol                                   = "Esp"
      source_address_prefix                      = "10.0.1.0/24"
      source_port_ranges                         = ["80", "443"]
      destination_application_security_group_ids = [run.setup.application_security_group_id]
      destination_port_range                     = "3389"
      description                                = "This is a rule."
      }, {
      name                                  = "OutboundRule2"
      priority                              = 200
      access                                = "Allow"
      protocol                              = "Ah"
      source_application_security_group_ids = [run.setup.application_security_group_id]
      source_port_range                     = "*"
      destination_address_prefixes          = ["10.0.2.0/25", "10.0.2.128/25"]
      destination_port_range                = "443"
      }, {
      name                       = "OutboundRule3"
      priority                   = 300
      access                     = "Deny"
      protocol                   = "*"
      source_address_prefixes    = ["10.0.3.0/25", "10.0.3.128/25"]
      source_port_range          = "1443"
      destination_address_prefix = "10.0.0.0/24"
      destination_port_ranges    = ["80", "443"]
    }]
  }
}
