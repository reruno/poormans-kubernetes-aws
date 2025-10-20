resource "aws_vpc" "poormans-kubernetes" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "vpc-poormans-kubernetes"
  }
}