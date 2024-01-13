variable "name" {
  type        = string
  description = "The name of the network security group."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the network security group."
}

variable "location" {
  type        = string
  description = "The location/region where the network security group is created. "
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "inbound_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    access                     = string
    protocol                   = string
    source_address_prefix      = optional(string, "*")
    source_port_range          = optional(string, "*")
    destination_address_prefix = optional(string, "*")
    destination_port_range     = optional(string, "*")
    description                = optional(string)
  }))
  default     = []
  description = "List of objects that represent the configuration of each inbound rule."
}

variable "outbound_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    access                     = string
    protocol                   = string
    source_address_prefix      = optional(string, "*")
    source_port_range          = optional(string, "*")
    destination_address_prefix = optional(string, "*")
    destination_port_range     = optional(string, "*")
    description                = optional(string)
  }))
  default     = []
  description = "List of objects that represent the configuration of each outbound rule."
}
