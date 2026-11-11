provider "aws" {
  region = var.aws_region
}

# Latest Ubuntu 22.04 LTS AMI (Canonical)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Use the default VPC so the demo works in any fresh AWS account
data "aws_vpc" "default" {
  default = true
}

# Reusable module: security group + EC2 instance that runs the Docker app
module "web_server" {
  source = "./modules/web_server"

  project_name  = var.project_name
  environment   = var.environment
  ami_id        = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_id        = data.aws_vpc.default.id
  app_port      = var.app_port
  allowed_cidr  = var.allowed_cidr
  docker_image  = var.docker_image
}
