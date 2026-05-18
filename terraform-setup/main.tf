provider "aws" {
  region = var.region
}

module "sg" {
  source = "./modules/security-group"
}

module "ec2" {
  source   = "./modules/ec2"
  sg_id    = module.sg.sg_id
  key_name = var.key_name
  image    = var.docker_image
}
