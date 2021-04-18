resource "aws_route_table" "cluster_rt" {
  vpc_id = aws_vpc.cluster_vpc.id
    
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.cluster_igw.id 
  }
    
  tags = merge(
    local.common_tags,
    map(
      "Name", "${local.cluster_name}-rt"
    )
  )
}

resource "aws_route_table_association" "cluster_rta" {
    subnet_id = aws_subnet.cluster_subnet.id
    route_table_id = aws_route_table.cluster_rt.id
}
