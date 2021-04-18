provider "aws" {
  profile    = "default"
  region     = var.aws_region
}

resource "random_id" "id" {
  byte_length = 2
}

data "http" "my_public_ip" {
  url = "http://ipv4.icanhazip.com"
}

locals {

  unfiltered_owner_tags = {
   "Owner_Name" = var.owner_name
   "Owner_Email" = var.owner_email
  }
  non_empty_owner_tags = {
    for key,value in local.unfiltered_owner_tags:
      key => value
      if value != ""
  }
  common_tags = merge(
    var.aws_tags,
    local.non_empty_owner_tags
  )

  cluster_name = var.cluster_name_random_string ? format("%s-%s", var.cluster_name, random_id.id.hex) : var.cluster_name

  admin_cidrs = length(var.admin_cidrs) > 0 ? var.admin_cidrs :  ["${chomp(data.http.my_public_ip.body)}/32"]
}

