resource "aws_instance" "portfolio_server" {
  ami           = "ami-091138d0f0d41ff90"
  instance_type = "t3.micro"
  key_name      = var.key_name

  vpc_security_group_ids = [var.sg_id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install docker.io -y
              systemctl start docker
              systemctl enable docker
              sleep 15
              docker run -d -p 80:80 ${var.image}
              EOF

  tags = {
    Name = "DevOps-Terraform-Server"
  }
}
