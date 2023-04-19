resource "aws_security_group" "sq" {
 name        = "sq"
 description = "Allow HTTPS to web server"
 vpc_id      = aws_vpc.vpc.id

ingress {
   description = "HTTPS ingress"
   from_port   = 0
   to_port     = 65535
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
}
}
