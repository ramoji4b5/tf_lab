############output#####################
output "mybucket" {
  value = module.bucket.s3bucket
}


output "ServerId" {
  value = module.appServer.instance_id
}

output "ServerIP" {
   value = module.appServer.instance_IP
}