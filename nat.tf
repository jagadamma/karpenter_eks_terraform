resource "aws_eip" "nat_eip"{
    vpc = true
    depends_on = [aws_internet_gateway.igw]
    tags ={
        Name ="NAT gateway eip"
    }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.pub_subnet-1.id
  tags = {
    Name = "gw NAT"
  }
}
