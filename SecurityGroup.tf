resource "aws_security_group" "ngnix-sg" {
    vpc_id = aws_vpc.my-vpc.id

    #inBound Rule
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    #outbound Rule
    egress   {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    } 
    tags = {
      key = "ngnix-sg"
    }

  
}