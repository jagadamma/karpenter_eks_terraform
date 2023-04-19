resource "aws_lb_target_group" "tg" {
  name        = "TargetGroup"
  port        = 8080
  protocol    = "TCP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "instance"

   health_check {
    path = "/"
    port = "80"
    protocol = "HTTP"
    matcher = "200"
    interval = 70
    timeout =  60
  }

  depends_on = [
    aws_lb.lb
  ]
}
