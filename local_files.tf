resource "local_file" "ansible_inventory" {
  content = templatefile("hosts.yml.tmpl",
  {
    ssh_username = var.ssh_user,
    ssh_key = var.ssh_key_name,
    zookeeper_public_dns = aws_instance.zookeeper.*.public_dns,
    zookeeper_private_dns = aws_instance.zookeeper.*.private_dns,
    kafka_broker_public_dns = aws_instance.brokers.*.public_dns,
    kafka_broker_private_dns = aws_instance.brokers.*.private_dns,
    schema_registry_public_dns = aws_instance.schema_registry.*.public_dns,
    schema_registry_private_dns = aws_instance.schema_registry.*.private_dns,
    kafka_rest_public_dns = aws_instance.rest_proxy.*.public_dns,
    kafka_rest_private_dns = aws_instance.rest_proxy.*.private_dns,
    ksql_public_dns = aws_instance.ksql.*.public_dns,
    ksql_private_dns = aws_instance.ksql.*.private_dns,
    kafka_connect_public_dns = aws_instance.connect.*.public_dns,
    kafka_connect_private_dns = aws_instance.connect.*.private_dns,
    control_center_public_dns = aws_instance.control_center.*.public_dns
    control_center_private_dns = aws_instance.control_center.*.private_dns
  }
  )
  filename = "hosts.yml"
}
