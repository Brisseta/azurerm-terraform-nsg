locals {
  input_rules = var.input_rules_enabled ? jsondecode(
    templatefile(format("%s/data/input_rules.json", path.module), {
    })) : []
  rules                   = concat(local.input_rules)
}
resource "azurerm_network_security_group" "nsg" {
  name = var.name

  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "security_rule" {
    for_each = {for rule in local.rules : rule.Name => rule}
    content {
      name                         = security_rule.value.Name
      description                  = format("%s -- %s", var.environment, security_rule.value.Description)
      priority                     = security_rule.value.Priority
      direction                    = security_rule.value.Direction
      access                       = security_rule.value.Access
      protocol                     = security_rule.value.Protocol
      source_port_range            = security_rule.value.SourcePortRange
      destination_port_range       = security_rule.value.DestinationPortRange
      source_address_prefix        = length(split(",", security_rule.value.SourceAddressPrefix)) == 1 ? security_rule.value.SourceAddressPrefix : ""
      source_address_prefixes      = length(split(",", security_rule.value.SourceAddressPrefix)) == 1 ? [] : split(",", security_rule.value.SourceAddressPrefix)
      destination_address_prefix   = length(split(",", security_rule.value.DestinationAddressPrefix)) == 1 ? security_rule.value.DestinationAddressPrefix : ""
      destination_address_prefixes = length(split(",", security_rule.value.DestinationAddressPrefix)) == 1 ? [] : split(",", upper(security_rule.value.DestinationAddressPrefix))
    }
  }
  tags = var.tags
}