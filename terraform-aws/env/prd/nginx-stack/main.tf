provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "bucket-nginx-test"
    region  = "us-east-1"
    key     = "nginx-folder/terraform.tfstate"
  }
}

module "aws_networking" {
  source              = "../../../modules/networking"
  vpc_cidr            = "10.0.0.0/16"
  pub_subnet_cidr     = "10.0.0.0/24"
}

#coleta security group e vpc id do output do modulo Networking
module "ec2_instance" {
  source              = "../../../modules/ec2"
  ami_id              = "${var.ami_id}"
  instance_type       = "${var.instance_type}"
  key_name            = "${var.key-name}"
  subnet_id_instance  = "${module.aws_networking.subnet_id}"
  public_ip           = true
  path_user_data      = "user-data.sh"
  ec2_security_groups = ["${module.aws_networking.sg_id}"]
  instance_name       = "${var.instance_name}"
}
