output "instance_id" {
  value =aws_instance.web.id
}

output "instance_IP" {
    value =aws_instance.web.private_ip
}