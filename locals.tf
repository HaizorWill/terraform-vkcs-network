locals {
  private_dns_domain = try(endswith(var.private_dns_domain, ".") ? var.private_dns_domain : format("${var.private_dns_domain}%s", "."), null)
  subnets = var.subnets != null ? { for id, subnet in var.subnets :
    coalesce(subnet.resource_key, subnet.name, format("subnet-%s", id)) => merge(subnet, {
      no_gateway         = subnet.gateway_ip != null ? null : subnet.no_gateway
      enable_private_dns = subnet.dns_nameservers != null ? false : subnet.enable_private_dns
      allocation_pool    = subnet.allocation_pool != null ? subnet.allocation_pool : []
    })
  } : {}
}
