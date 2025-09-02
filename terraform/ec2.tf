resource "aws_instance" "public_instance" {
  ami                    = data.aws_ami.amazon_linux.image_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.internet.id]

  associate_public_ip_address = true
  key_name                    = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    systemctl start docker
    systemctl enable docker

    usermod -aG docker ec2-user

    docker pull gtsintsadze1/nodeapp:latest

    if [ $(docker ps -a -q -f name=nodeapp) ]; then
      docker stop nodeapp
      docker rm nodeapp
    fi

    docker run -d --name nodeapp -p 80:3000 --restart unless-stopped gtsintsadze1/nodeapp:latest
  EOF

  tags = {
    Name = "public-instance"
  }
}
