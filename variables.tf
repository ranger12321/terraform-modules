variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_1_cidr_block" {
  description = "CIDR block for private subnet 1"
  default     = "10.0.2.0/24"
}

variable "private_subnet_2_cidr_block" {
  description = "CIDR block for private subnet 2"
  default     = "10.0.3.0/24"
}

variable "availability_zone_public" {
  description = "Availability zone for the public subnet"
  default     = "us-east-1a"
}

variable "availability_zone_private_1" {
  description = "Availability zone for private subnet 1"
  default     = "us-east-1a"
}

variable "availability_zone_private_2" {
  description = "Availability zone for private subnet 2"
  default     = "us-east-1b"
}

variable "domain_name" {
  description = "Domain name for the Route53 hosted zone"
  default     = "mydomain.com"
}

variable "record_name" {
  description = "Record name for the Route53 DNS record"
  default     = "www.mydomain.com"
}

variable "record_type" {
  description = "Type of the Route53 DNS record"
  default     = "A"
}

variable "record_ttl" {
  description = "TTL (Time to Live) for the Route53 DNS record"
  default     = 300
}

variable "record_ip" {
  description = "IP address for the Route53 DNS record"
  default     = "1.2.3.4"
}
