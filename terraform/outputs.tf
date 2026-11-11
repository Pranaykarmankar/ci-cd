output "instance_id" {
  description = "ID of the provisioned EC2 instance"
  value       = module.web_server.instance_id
}

output "public_ip" {
  description = "Public IP of the provisioned server"
  value       = module.web_server.public_ip
}

output "app_url" {
  description = "URL where the app will be reachable"
  value       = "http://${module.web_server.public_ip}:${var.app_port}"
}

output "security_group_id" {
  description = "Security group attached to the server"
  value       = module.web_server.security_group_id
}
