provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "${var.bucket-name}"
    region  = "${var.region}"
    key     = "${var.bucket-folder}/terraform.tfstate"
  }
}

module "aws_networking" {
  source              = "../../../modules/networking"
  vpc_cidr            = "10.0.0.0/16"
  pub_subnet_cidr     = "10.0.0.0/24"
}

module "ec2_instance" {
  source              = "../../../modules/ec2"
  ami_id              = ""
  instance_type       = ""
  key_name            = ""
  subnet_id_instance  = "${module.aws_networking.subnet_id}"
  public_ip           = true
  ec2_security_groups = ""
  instance_name       = ""
}
