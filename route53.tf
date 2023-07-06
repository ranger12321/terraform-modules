# Create Route53 hosted zone
resource "aws_route53_zone" "my_hosted_zone" {
  name = var.domain_name  # Replace with your desired domain name
}

# Create DNS record
resource "aws_route53_record" "my_record" {
  zone_id = aws_route53_zone.my_hosted_zone.zone_id
  name    = var.record_name  # Replace with your desired record name
  type    = var.record_type
  ttl     = var.record_ttl
  records = var.record_ip  # Replace with the desired IP address
}
