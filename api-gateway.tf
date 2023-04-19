resource "aws_api_gateway_vpc_link" "test" {
  name        = "app"
  target_arns = ["${aws_lb.lb.arn}"]
}


resource "aws_api_gateway_rest_api" "example" {
  name = "www"
}
