resource "aws_lb" "lb" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "network"
  subnets            = [aws_subnet.pub_subnet-1.id,aws_subnet.pub_subnet-2.id]
}                      
