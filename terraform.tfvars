name                     = "test_nsg"
environment              = "dev"
default_nsg_subnets_cidr = [
  {
    "subnet_name" : "lan1",
    "subnet_cidr" : "172.21.0.0/24"
  }, {
    "subnet_name" : "mgmt",
    "subnet_cidr" : "172.21.1.0/24"
  }
]
resource_group_name = "Test_infoblox_DNS"
location            = "westeurope"
input_rules_enabled = true
tags                = {
  "toto" : "toto"
}