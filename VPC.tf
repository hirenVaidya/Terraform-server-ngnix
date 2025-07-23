resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my-vpc"
    }
}

#public subnet

resource "aws_subnet" "public-subnet" {
    cidr_block  = "10.0.2.0/24"
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        name ="public-subnet"
    }
}

# Private subnet

resource "aws_subnet" "private-subnet" {
    cidr_block  = "10.0.1.0/24"
    vpc_id = aws_vpc.my-vpc.id
  tags = {
    name = "private-subnet"
  }
}



# internet gateway
resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = "my-igw"
    }
}

# route table for public subnet
resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
}
}

resource "aws_route_table_association" "public-subnet-ass" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.my-rt.id
}

