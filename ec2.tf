# ec2.tf
resource "aws_instance" "public_instance" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (update as needed)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key_pair.key_name
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [
    aws_security_group.allow_all.name
  ]

  tags = {
    Name = "Public-VM"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}

resource "aws_instance" "private_instance" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (update as needed)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key_pair.key_name
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name = "Private-VM"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}
