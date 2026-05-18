variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "key_name" {
  description = "EC2 key pair name"
}

variable "docker_image" {
  description = "Docker image to deploy"
}
