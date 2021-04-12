data "http" "my_public_ip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "workstation_sg" {
  name        = "workstation-sg-${local.cluster_name}"
  description = "Allow all connections from Workstations Public IP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${chomp(data.http.my_public_ip.body)}/32"]
  }
}
