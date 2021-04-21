variable "aws_region" {
  description = "AWS region where to deploy the cluster"
  default = "us-west-2"
}

variable "aws_availability_zone" {
  description = "AWS AZ where to deploy the cluster"
  default = "us-west-2b"
}

variable "cluster_name" {
  description = "The name of the provisioned cluster"
  default     = "cp-terrible"
}

// Help avoid name collisions
variable "cluster_name_random_string" {
  description = "Add a random string to the cluster name"
  default     = true
}

variable "owner_name" {
  description = "Name to use for AWS tag Owner_Name"
  default     = ""
}

variable "owner_email" {
  description = "Name to use for AWS tag Owner_Email"
  default     = ""
}

// Any aditional tags, other than Owenr name and email
variable "aws_tags" {
  description = "Add custom tags to all resources"
  type        = map
  default     = {}
}

variable "ssh_key_name" {
  description = "SSH Key Name on AWS"
  default = "hsingh"
}

variable "zookeeper_count" {
  description = "Number of ZK instances"
  default     = 3
}

variable "zookeeper_instance_type" {
  description = "EC2 instance type for ZK Nodes"
  default     = "t3a.large"
}

variable "broker_count" {
  description = "Number of broker instances"
  default     = 3
}

variable "broker_instance_type" {
  description = "EC2 instance type for brokers"
  default     = "t3a.large"
}

variable "connect_count" {
  description = "Number of Connect worker instances"
  default     = 0
}

variable "connect_instance_type" {
  description = "EC2 instance type for Connect workers"
  default     = "t3a.large"
}

variable "schema_registry_count" {
  description = "Number of Schema registry instances"
  default     = 0
}

variable "schema_registry_instance_type" {
  description = "EC2 instance type for Schema Registry"
  default     = "t3a.large"
}

variable "rest_proxy_count" {
  description = "Number of Rest Proxy instances"
  default     = 0
}

variable "rest_proxy_instance_type" {
  description = "EC2 instance type for Rest Proxy"
  default     = "t3a.large"
}

variable "control_center_count" {
  description = "Number of C3 instances"
  default     = 0
}

variable "control_center_instance_type" {
  description = "EC2 instance type for C3"
  default     = "t3a.large"
}

variable "ksql_count" {
  description = "Number of KSQL instances"
  default     = 0
}

variable "ksql_instance_type" {
  description = "EC2 instance type for KSQL"
  default     = "t3a.large"
}

variable "aws_ami_id"  {
  default = "ami-02701bcdc5509e57b"
}

variable "ssh_user" {
  default = "ubuntu"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC that will be created"
  default     = "10.0.0.0/16"
}

variable "admin_cidrs" {
  type        = list
  description = "Admin CIDRs to allow access to the cluster from outside"
  default     = []
  // when empty public IP of the machine running terraform is used as a /32 CIDR
}
