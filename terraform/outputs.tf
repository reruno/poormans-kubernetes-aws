output "ec2_public_instance_1_public_ip" {
  description = "The public IP address of the public_instance_1 instance."
  value       = aws_instance.public_instance_1.public_ip
}

output "ec2_private_instance_1_private_ip" {
  description = "The private IP address of the private_instance_1 instance."
  value       = aws_instance.private_instance_1.private_ip
}