#variable "instance_list" {
#  description = "Push these instances to ALB"
#  type = list
#  default = ["i00001", "i00002", "i00003"]
#}

resource "aws_alb_target_group_attachment" "tgattachmentdone" {
  target_group_arn = aws_lb_target_group.tg.arn
#  target_id =  aws_instance.aws_eks_node_group.node_group1[count.index].id
  target_id  = aws_eks_node_group.node_group1.id
#  target_id = element(var.instance_list, count.index)
  port             = 80
}
                       
resource "aws_alb_listener" "alb-listener" {
	load_balancer_arn = aws_lb.lb.arn
	port = 80
	protocol = "TCP"
	default_action {
    	type             = "forward"
    	target_group_arn =  aws_lb_target_group.tg.id

        }
        depends_on = [
        aws_lb.lb,
        aws_lb_target_group.tg
  ]
}
