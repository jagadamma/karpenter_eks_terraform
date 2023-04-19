resource "aws_launch_configuration" "example" {
  name_prefix = "example-asg-"

  image_id = aws_eks_node_group.node_group1.id
  instance_type = "t2.micro"
 # security_groups = [aws_security_group.eks_cluster.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  name_prefix = "example-asg-"

  vpc_zone_identifier = ["${aws_subnet.pub_subnet-1.id}"]
  launch_configuration = aws_launch_configuration.example.name
  min_size = 2
  max_size = 2
  desired_capacity = 2
}



#resource "aws_autoscaling_group" "example_asg" {
#  name                 = "example-asg"
#  launch_template{
#    id =  "aws_eks_node_groupnode_group1.id"
#    version = "$Latest"
#  }
# target_group_arns    = [aws_lb_target_group.example_target_group.arn]
#  vpc_zone_identifier  = aws_subnet.pub_subnet-1.id
#  desired_capacity     = 2
#  min_size             = 2
#  max_size             = 2
#  health_check_type    = "EC2"
#  health_check_grace_period = 300
#  termination_policies = ["OldestInstance", "Default"]
#  tag {
 #   key                 = ""
 #   value               = "example-asg"
 #   propagate_at_launch = true
 # }
# }
