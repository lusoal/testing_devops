#variavies para o state do terraform
variable "region" {
  default = "us-east-1"
}

variable "bucket-folder" {
  default = "nginx-folder"
}

variable "bucket-name" {
    default = "bucket-nginx-test"
}



variable "ami_id" {
  default = "ami-0ff8a91507f77f867"
}

variable "instance_type" {
  default = "t2.micro" 
}

variable "key-name" {
  default = "lucas-duarte"
}

variable "instance_name" {
  default = "My_Application_ec2"
}

variable "path_user_data" {
  default = "./user-data.sh"
}
