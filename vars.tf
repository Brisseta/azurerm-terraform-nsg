variable "name" {
  type        = string
  description = "Name for Network Security Group name"
}
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}
variable "location" {
  type        = string
  description = "Location of the NSG"
}
variable "input_rules_enabled" {
  description = "True to configure with input rules."
  type        = bool
  default     = false
}
variable "tags" {
  type        = map(string)
  description = "Specify the tags applied on the network security group."
}
variable "environment" {
  type        = string
  description = "Environment used to select the default rules file."
  validation {
    condition     = can(regex("^(dev|qualif|prod)$", var.environment))
    error_message = "Environment must match `dev`, `qualif` or `prod`."
  }
}
#data "template_file" "default_nsg_subnets_template" {
#  template = file("./data/default_nsg_subnets_template.tpl")
#  for_each = {for subnet, count in var.default_nsg_subnets_cidr : subnet => [
#      for i in range(count) : format("%s%02d", subnet, i)
#    ]}
#  vars     = {
#    Priority                 = 300 + each.key
#    Name                     = concat(each.value.subnet_name, "_to_", each.value.subnet_name)
#    Access                   = "Allow"
#    Protocol                 = "*"
#    SourcePortRange          = "*"
#    DestinationPortRange     = "*"
#    SourceAddressPrefix      = each.value.subnet_cidr
#    DestinationAddressPrefix = each.value.subnet_cidr
#    Description              = var.environment
#  }
#}
#variable "default_nsg_subnets_cidr" {
#  type        = list(map(string))
#  description = "Specify the cidr and names of subnet associated to the network security group."
#}
