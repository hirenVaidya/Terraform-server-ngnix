
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.4.0"
    }
  }
}


resource "aws_instance" "Ngnixserver" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [aws_security_group.ngnix-sg.id]
    associate_public_ip_address = true
    user_data = <<-E0F
              #!/bin/bash
              sudo yum install ngnix -y
              sudo systeml start ngnix
    E0F

tags = {
 Name = "Ngnixserver"
}  
}