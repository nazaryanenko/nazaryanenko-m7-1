provider "aws" {
  region = var.region
}

module "security_group" {
  source = "../modules/security_group"
}

module "server1" {
  name                  = "server 1"
  source                = "../modules/ec2"
  vpc_security_group_id = module.security_group.security_group_id
}

module "server2" {
  name                  = "server 2"
  source                = "../modules/ec2"
  vpc_security_group_id = module.security_group.security_group_id
}
