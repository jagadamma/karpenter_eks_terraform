resource "aws_api_gateway_deployment" "deployment1" {
  rest_api_id = aws_api_gateway_rest_api.example.id

 # triggers = {
 #   redeployment = sha1(jsonencode(aws_api_gateway_rest_api.example.body))
 # }

  depends_on = [aws_api_gateway_integration.test]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "example" {
  deployment_id = aws_api_gateway_deployment.deployment1.id
  rest_api_id   = aws_api_gateway_rest_api.example.id
  stage_name    = "v1"
}
  # output "complete_unvoke_url"   {value = "${aws_api_gateway_deployment.deployment1.invoke_url}${aws_api_gateway_example.stage_name}/${aws_api_gateway_resource.v1.path_part}"}
