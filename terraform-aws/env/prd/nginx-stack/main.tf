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

module "ec2_instance" {
  source              = "../../../modules/ec2"
  ami_id              = ""
  instance_type       = ""
  key_name            = ""
  subnet_id_instance  = ""
  public_ip           = ""
  ec2_security_groups = ""
  instance_name       = ""
}
