"default_nsg_subnets_rules" : [
    {
      "Priority"                  : "${Priority}"
      "Name"                      : "${Name}_in"
      "Direction"                 : "Inbound"
      "Access"                    : "${Access}"
      "Protocol"                  : "${Protocol}"
      "SourcePortRange"           : "${SourcePortRange}"
      "DestinationPortRange"      : "${DestinationPortRange}"
      "SourceAddressPrefix"       : "${SourceAddressPrefix}"
      "DestinationAddressPrefix"  : "${DestinationAddressPrefix}"
      "Description"               : ${Description} --$(Name)
    },
    {
      "Priority"                  : "${Priority}"
      "Name"                      : "${Name}_out"
      "Direction"                 : "Outbound"
      "Access"                    : "${Access}"
      "Protocol"                  : "${Protocol}"
      "SourcePortRange"           : "${SourcePortRange}"
      "DestinationPortRange"      : "${DestinationPortRange}"
      "SourceAddressPrefix"       : "${SourceAddressPrefix}"
      "DestinationAddressPrefix"  : "${DestinationAddressPrefix}"
      "Description"               : "${Description} --$(Name)"
    },
]