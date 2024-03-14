
provider "aws" {
  region = "us-east-1"
}



module "vpc" {
  source = "./VPC"
}

module "ec2" {
  source            = "./EC2"
  public_subnet_ids = module.vpc.public_subnet_ids
  security_group_id = module.security_group.security_group_id
}


module "security_group" {
  source = "./SG"
  vpc_id = module.vpc.vpc_id
}



output "vpcid" {
  value = module.vpc.vpc_id
}
output "vpcsub" {
  value = module.vpc.public_subnet_ids
}
output "sg" {
  value = module.security_group.security_group_id
}
output "ec2" {
  value = module.ec2.instances
}