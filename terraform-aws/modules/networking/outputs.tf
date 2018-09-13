output "subnet_id" {
  value = "${aws_subnet.pub_subnet_1a.id}"
}

output "sg_id" {
  value = "${aws_security_group.allow_ssh_http.id}"
}
