resource "aws_instance" "Ngnixserver" {
    ami = "ami-0b32d400456908bf9"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [aws_security_group.ngnix-sg.id]
    associate_public_ip_address = true


    user_data = <<-E0F
              #!/bin/bash
              sudo yum install nginx -y
              sudo systemctl start nginx
    E0F

    tags = {
    Name = "Ngnixserver"
    }  
}