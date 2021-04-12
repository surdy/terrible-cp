resource "aws_instance" "zookeeper" {
  count         = var.zookeeper_count
  ami           = var.aws_ami_id
  instance_type = var.zookeeper_instance_type
  key_name = var.ssh_key_name

  root_block_device {
    volume_size = 100
  }

  tags = merge(
    local.common_tags,
    map(
      "Name", "${var.cluster_name}-zookeeper-${count.index}"
    )
  )

  subnet_id = var.subnet_id
  vpc_security_group_ids = local.security_group_ids
  associate_public_ip_address = true
}

resource "aws_instance" "brokers" {
  count         = var.broker_count
  ami           = var.aws_ami_id
  instance_type = var.broker_instance_type
  key_name = var.ssh_key_name

  root_block_device {
    volume_size = 1000
  }

  tags = merge(
    local.common_tags,
    map(
      "Name", "${var.cluster_name}-zookeeper-${count.index}"
    )
  )

  subnet_id = var.subnet_id
  vpc_security_group_ids = local.security_group_ids
  associate_public_ip_address = true
}

resource "aws_instance" "connect" {
  count         = var.connect_count
  ami           = var.aws_ami_id
  instance_type = var.connect_instance_type
  key_name = var.ssh_key_name

  tags = merge(
    local.common_tags,
    map(
      "Name", "${var.cluster_name}-zookeeper-${count.index}"
    )
  )

  subnet_id = var.subnet_id
  vpc_security_group_ids = local.security_group_ids
  associate_public_ip_address = true
}

resource "aws_instance" "schema_registry" {
  count         = var.schema_registry_count
  ami           = var.aws_ami_id
  instance_type = var.schema_registry_instance_type
  key_name = var.ssh_key_name

  tags = merge(
    local.common_tags,
    map(
      "Name", "${var.cluster_name}-zookeeper-${count.index}"
    )
  )

  subnet_id = var.subnet_id
  vpc_security_group_ids = local.security_group_ids
  associate_public_ip_address = true
}

resource "aws_instance" "control_center" {
  count         = var.control_center_count
  ami           = var.aws_ami_id
  instance_type = var.control_center_instance_type
  key_name = var.ssh_key_name

  root_block_device {
    volume_size = 1000
  }

  tags = merge(
    local.common_tags,
    map(
      "Name", "${var.cluster_name}-zookeeper-${count.index}"
    )
  )

  subnet_id = var.subnet_id
  vpc_security_group_ids = local.security_group_ids
  associate_public_ip_address = true
}

resource "aws_instance" "rest_proxy" {
  count         = var.rest_proxy_count
  ami           = var.aws_ami_id
  instance_type = var.rest_proxy_instance_type
  key_name = var.ssh_key_name

  tags = merge(
    local.common_tags,
    map(
      "Name", "${var.cluster_name}-zookeeper-${count.index}"
    )
  )

  subnet_id = var.subnet_id
  vpc_security_group_ids = local.security_group_ids
  associate_public_ip_address = true
}

resource "aws_instance" "ksql" {
  count         = var.ksql_count
  ami           = var.aws_ami_id
  instance_type = var.ksql_instance_type
  key_name = var.ssh_key_name

  root_block_device {
    volume_size = 1000 # 1TB
  }

  tags = merge(
    local.common_tags,
    map(
      "Name", "${var.cluster_name}-zookeeper-${count.index}"
    )
  )

  subnet_id = var.subnet_id
  vpc_security_group_ids = local.security_group_ids
  associate_public_ip_address = true
}
