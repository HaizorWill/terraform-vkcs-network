# VKCS Network Terraform Module

Terraform module that creates a network with subnets in VK Cloud.

It aims to provide a flexible and simplified way to create networks in VK Public Cloud.

## Features

It supports creating:

 * A single network
 * Multiple subnets in the network

## Inputs

### <a name="sdn"></a> [sdn](#sdn)

Description: the SDN of the network

Type: `string`

Default: `sprut`

### <a name="name"></a> [name](#name)

Description: the name of the network

Type: `string`

Default: `null`

### <a name="description"></a> [description](#description)

Description: the description of the network

Type: `string`

Default: `null`

### <a name="tags"></a> [tags](#tags)

Description: the list of tags for the network

Type: `list(string)`

Default: `[]`

### <a name="admin_state_up"></a> [admin_state_up](#admin_state_up)

Description: controls the admin state of the network

Type: `bool`

Default: `true`

### <a name="port_security_enabled"></a> [port_security_enabled](#port_security_enabled)

Description: controls the state of port security on the network

Type: `bool`

Default: `true`

### <a name="private_dns_domain"></a> [private_dns_domain](#private_dns_domain)

Description: the local DNS domain of the network

Type: `string`

Default: `null`

### <a name="value_specs"></a> [value_specs](#value_specs)

Description: the map of additional options of the network; refer to VK Cloud documentation for additional information

Type: `map(string)`

Default: `{}`

### <a name="vkcs_services_access"></a> [vkcs_services_access](#vkcs_services_access)

Description: 

Type: `bool`

Default: `null`

### <a name="subnets"></a> [subnets](#subnets)

Description: the list of subnets which are added to the network

Type:
```hcl
list(object({
    name         = optional(string)
    description  = optional(string)
    tags         = optional(list(string))
    resource_key = optional(string)
    cidr         = optional(string)
    no_gateway   = optional(bool)
    gateway_ip   = optional(string)
    enable_dhcp  = optional(bool)
    allocation_pool = optional(list(object({
      start = string
      end   = string
    })))
    enable_private_dns = optional(bool)
    dns_nameservers    = optional(list(string))
  }))
```

Default: `null`
