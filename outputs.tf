output "zookeeper_public_dns" {
  value = [aws_instance.zookeeper.*.public_dns]
}

output "broker_public_dns" {
  value = [aws_instance.brokers.*.public_dns]
}

output "connect_public_dns" {
  value = [aws_instance.connect.*.public_dns]
}

output "schema_registry_public_dns" {
  value = [aws_instance.schema_registry.*.public_dns]
}

output "control_center_public_dns" {
  value = [aws_instance.control_center.*.public_dns]
}

output "rest_proxy_public_dns" {
  value = [aws_instance.rest_proxy.*.public_dns]
}

output "ksql_public_dns" {
  value = [aws_instance.ksql.*.public_dns]
}

output "login_info" {
  value = {
    "ssh_username" = var.ssh_user
    "ssh_key" = var.ssh_key_name
  }
}
