<!-- markdownlint-disable MD041 MD013 -->
## 2.0.0 (January 15, 2024)

BREAKING CHANGES:

* Dependencies: updating to `v1.3.0` minimum of `terraform`.
* The internal name by which the `azurerm_network_security_rule` resource is defined was defined as `inbound` and `outbound`. This has been changed by `inbounds` and `outbounds` to maintain the internal consistency of the module, so the resources deployed in the previous version of the module are not compatible with this new version.
* The `inbound_rules.priority` parameter changes type string to `number`.
* The `outbound_rules.priority` parameter changes type string to `number`.

FEATURES:

* **New Parameter**: `inbound_rules.source_address_prefixes`
* **New Parameter**: `inbound_rules.source_application_security_group_ids`
* **New Parameter**: `inbound_rules.source_port_ranges`
* **New Parameter**: `inbound_rules.destination_address_prefixes`
* **New Parameter**: `inbound_rules.destination_application_security_group_ids`
* **New Parameter**: `inbound_rules.destination_port_ranges`
* **New Parameter**: `outbound_rules.source_address_prefixes`
* **New Parameter**: `outbound_rules.source_application_security_group_ids`
* **New Parameter**: `outbound_rules.source_port_ranges`
* **New Parameter**: `outbound_rules.destination_address_prefixes`
* **New Parameter**: `outbound_rules.destination_application_security_group_ids`
* **New Parameter**: `outbound_rules.destination_port_ranges`

ENHANCEMENTS:

* Internal changes that change the way data is received by child parameters, but do not change the behavior of the module.
* The `inbound_rules.source_address_prefix` parameter property now defaults to `null`.
* The `inbound_rules.source_port_range` parameter property now defaults to `null`.
* The `inbound_rules.destination_address_prefix` parameter property now defaults to `null`.
* The `inbound_rules.destination_port_range` parameter property now defaults to `null`.
* The `outbound_rules.source_address_prefix` parameter property now defaults to `null`.
* The `outbound_rules.source_port_range` parameter property now defaults to `null`.
* The `outbound_rules.destination_address_prefix` parameter property now defaults to `null`.
* The `outbound_rules.destination_port_range` parameter property now defaults to `null`.

## 1.0.1 (November 28, 2021)

ENHANCEMENTS:

* Internal changes that do not modify the operation of the module.

## 1.0.0 (November 12, 2020)

FEATURES:

* **New Parameter:** `name`
* **New Parameter:** `resource_group_name`
* **New Parameter:** `location`
* **New Parameter:** `inbound_rules`
* **New Parameter:** `inbound_rules.name`
* **New Parameter:** `inbound_rules.priority`
* **New Parameter:** `inbound_rules.access`
* **New Parameter:** `inbound_rules.protocol`
* **New Parameter:** `inbound_rules.source_address_prefix`
* **New Parameter:** `inbound_rules.source_port_range`
* **New Parameter:** `inbound_rules.destination_address_prefix`
* **New Parameter:** `inbound_rules.destination_port_range`
* **New Parameter:** `inbound_rules.description`
* **New Parameter:** `outbound_rules`
* **New Parameter:** `outbound_rules.name`
* **New Parameter:** `outbound_rules.priority`
* **New Parameter:** `outbound_rules.access`
* **New Parameter:** `outbound_rules.protocol`
* **New Parameter:** `outbound_rules.source_address_prefix`
* **New Parameter:** `outbound_rules.source_port_range`
* **New Parameter:** `outbound_rules.destination_address_prefix`
* **New Parameter:** `outbound_rules.destination_port_range`
* **New Parameter:** `outbound_rules.description`
* **New Parameter:** `tags`
