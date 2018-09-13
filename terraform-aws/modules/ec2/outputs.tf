#output for instance id
output "instance_id" {
  value = "${aws_instance.default.id}"
}

output "instance_name" {
  value = "${aws_instance.default.key_name}"
}