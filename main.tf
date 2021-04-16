provider "aws" {
  profile    = "default"
  region     = var.aws_region
}

resource "random_id" "id" {
  byte_length = 2
}

locals {

  unfiltered_owner_tags = {
   "Owner_Name" = var.owner_name
   "Owner_Email" = var.owner_email
  }
  filtered_owner_tags = {
    for key,value in local.unfiltered_owner_tags:
      key => value
      if value != ""
  }
  common_tags = merge(
    var.aws_tags,
    local.filtered_owner_tags
  )

  cluster_name = var.cluster_name_random_string ? format("%s-%s", var.cluster_name, random_id.id.hex) : var.cluster_name

  security_group_ids = length(module.ws_security_group) > 0 ? concat(var.security_group_ids, module.ws_security_group[0].sg_id) : var.security_group_ids
  //security_group_ids = var.add_workstation_access_sg ? concat(var.security_group_ids, [aws_security_group.workstation_sg.id]) : var.security_group_ids
  //security_group_ids = var.security_group_ids
}

module ws_security_group {
  source = "./modules/ws_security_group"
  count = var.add_workstation_access_sg ? 1 : 0 
  cluster_name = local.cluster_name
  vpc_id = var.vpc_id
}

