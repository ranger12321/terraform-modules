# Create Route53 hosted zone
resource "aws_route53_zone" "my_hosted_zone" {
  name = "mydomain.com"  # Replace with your desired domain name
}

# Create DNS record
resource "aws_route53_record" "my_record" {
  zone_id = aws_route53_zone.my_hosted_zone.zone_id
  name    = "www.mydomain.com"  # Replace with your desired record name
  type    = "A"
  ttl     = 300
  records = ["1.2.3.4"]  # Replace with the desired IP address
}
