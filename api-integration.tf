resource "aws_api_gateway_method" "post" {
  rest_api_id       = aws_api_gateway_rest_api.example.id
  resource_id       = aws_api_gateway_rest_api.example.root_resource_id   #aws_api_gateway_resource.v1.id
  http_method       = "POST"
  authorization     = "NONE"
  api_key_required  = false
}

resource "aws_api_gateway_integration" "test" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  resource_id = aws_api_gateway_rest_api.example.root_resource_id
  http_method = aws_api_gateway_method.post.http_method
  type                    = "HTTP"
  uri                     = "http://${aws_lb.lb.dns_name}"
  integration_http_method = "POST"
  connection_type = "VPC_LINK"
  connection_id   = aws_api_gateway_vpc_link.test.id
}

resource "aws_api_gateway_method" "get" {
  rest_api_id       = aws_api_gateway_rest_api.example.id
  resource_id       = aws_api_gateway_rest_api.example.root_resource_id   #aws_api_gateway_resource.v1.id
  http_method       = "GET"
  authorization     = "NONE"
  api_key_required  = false
}

resource "aws_api_gateway_integration" "test1" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  resource_id = aws_api_gateway_rest_api.example.root_resource_id
  http_method = aws_api_gateway_method.get.http_method
  type                    = "HTTP"
  uri                     = "http://${aws_lb.lb.dns_name}"
  integration_http_method = "GET"
  connection_type = "VPC_LINK"
  connection_id   = aws_api_gateway_vpc_link.test.id
}
