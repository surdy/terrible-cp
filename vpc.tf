resource "aws_vpc" "cluster_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true 
  enable_dns_hostnames = true

  tags = merge(
    local.common_tags,
    map(
      "Name", "${local.cluster_name}-vpc"
    )
  )
}
