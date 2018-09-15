resource "aws_instance" "default" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    =  "${var.key_name}"
  subnet_id                   = "${var.subnet_id_instance}"
  associate_public_ip_address = "${var.public_ip}"
  user_data                   = "${data.template_file.user_data.rendered}"
  security_groups             = ["${var.ec2_security_groups}"]

  tags {
    Name = "${var.instance_name}"
  }
}


data "template_file" "user_data" {
  template = "${file("${var.path_user_data}")}"
}