resource "aws_instance" "public_instance" {
  ami                    = data.aws_ami.amazon_linux.image_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.internet.id]

  associate_public_ip_address = true
  key_name                    = var.key_name

  user_data     = <<-EOF
    #!/bin/bash
    yum update
    amazon-linux-extras install docker -y
    docker pull gtsintsadze1/nodeapp:latest
    docker run -d --name nodeapp -p 80:3000 gtsintsadze1/nodeapp:latest
  EOF

  tags = {
    Name = "public-instance"
  }
}
