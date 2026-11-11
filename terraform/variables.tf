variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1" # Mumbai
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "jenkins-cicd-demo"
}

variable "environment" {
  description = "Environment tag (dev/test/prod)"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Existing EC2 key pair name for SSH access (optional)"
  type        = string
  default     = null
}

variable "app_port" {
  description = "Port the application listens on"
  type        = number
  default     = 3000
}

variable "allowed_cidr" {
  description = "CIDR allowed to reach SSH and the app. Restrict to your IP, e.g. 203.0.113.5/32"
  type        = string
  default     = "0.0.0.0/0"
}

variable "docker_image" {
  description = "Public Docker image to run on the new server (use any public image for the demo)"
  type        = string
  default     = "nginx:alpine"
}
