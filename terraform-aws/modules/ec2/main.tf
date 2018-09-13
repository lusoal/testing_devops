resource "aws_instance" "default" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    =  "${var.key_name}"
  subnet_id                   = "${var.subnet_id_instance}"
  associate_public_ip_address = "${var.public_ip}"
  security_groups             = ["${var.ec2_security_groups}"]

  tags {
    Name = "${var.instance_name}"
  }
}