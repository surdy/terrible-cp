owner_email = "hsingh@confluent.io"
owner_name = "Harpreet Singh"
ssh_key_name = "hsingh"
cluster_name = "harpreet-test-cp"

aws_region = "us-west-2"
aws_availability_zone = "us-west-2b"
aws_ami_id = "ami-0ae0b4d88e7ba7f27"

zookeeper_count = 3
broker_count = 3
connect_count = 2
schema_registry_count = 2
rest_proxy_count = 1
ksql_count = 2
control_center_count = 1

zookeeper_instance_type = "t3a.large"
broker_instance_type = "t3a.large"
schema_registry_instance_type = "t3.medium"
connect_instance_type = "t3a.large"
rest_proxy_instance_type = "t3.medium"
control_center_instance_type = "t3a.large"
ksql_instance_type = "t3a.large"

//admin_cidrs = ["108.211.107.148/32"]
// - "0.0.0.0/0" will open access from anywhwere . Not recommended
// - if unset it will detect public IP and use it with /32
// - if running teraform from a machine other than from where you want access
//   cluster/c3 then find your public IP and add it with /32 above 
