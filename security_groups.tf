resource "aws_security_group" "cluster_sg" {
  vpc_id = aws_vpc.cluster_vpc.id 

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = local.admin_cidrs
  }

  tags = merge(
    local.common_tags,
    tomap({
      "Name" = "${local.cluster_name}-sg"
    })
  )
}
