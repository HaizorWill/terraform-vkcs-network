resource "vkcs_networking_network" "this" {
  name                  = var.name
  description           = var.description
  tags                  = var.tags
  sdn                   = var.sdn
  admin_state_up        = var.admin_state_up
  port_security_enabled = var.port_security_enabled
  private_dns_domain    = local.private_dns_domain
  value_specs           = var.value_specs
  vkcs_services_access  = var.vkcs_services_access
}

resource "vkcs_networking_subnet" "this" {
  for_each = local.subnets

  name        = each.value.name
  description = each.value.description
  tags        = each.value.tags
  network_id  = vkcs_networking_network.this.id
  cidr        = each.value.cidr
  no_gateway  = each.value.no_gateway
  gateway_ip  = each.value.gateway_ip
  enable_dhcp = each.value.enable_dhcp
  dynamic "allocation_pool" {
    for_each = each.value.allocation_pool != null ? each.value.allocation_pool : []

    content {
      start = allocation_pool.value.start
      end   = allocation_pool.value.end
    }
  }
  enable_private_dns = each.value.enable_private_dns
  dns_nameservers    = each.value.dns_nameservers
}


