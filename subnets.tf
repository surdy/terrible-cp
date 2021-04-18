resource "aws_subnet" "cluster_subnet" {
  vpc_id                  = aws_vpc.cluster_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, 0)
  map_public_ip_on_launch = true
   availability_zone      = var.availability_zone

  tags = merge(
    local.common_tags,
    map(
      "Name", "${local.cluster_name}-subnet"
    )
  )
}

resource "aws_internet_gateway" "cluster_igw" {
  vpc_id = aws_vpc.cluster_vpc.id

  tags = merge(
    local.common_tags,
    map(
      "Name", "${local.cluster_name}-igw"
    )
  )
}
