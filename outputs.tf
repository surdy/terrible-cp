// Output

output "zookeeper_private_dns" {
  value = [aws_instance.zookeeper.*.private_dns]
}

output "broker_private_dns" {
  value = [aws_instance.brokers.*.private_dns]
}

output "connect_private_dns" {
  value = [aws_instance.connect.*.private_dns]
}

output "schema_registry_private_dns" {
  value = [aws_instance.schema_registry.*.private_dns]
}

output "control_center_private_dns" {
  value = [aws_instance.control_center.*.private_dns]
}

output "rest_proxy_private_dns" {
  value = [aws_instance.rest_proxy.*.private_dns]
}

output "ksql_private_dns" {
  value = [aws_instance.ksql.*.private_dns]
}

# cluster data
output "cluster_data" {
  value = {
    "ssh_username" = var.ssh_user
    "ssh_key" = var.ssh_key_name
  }
}
