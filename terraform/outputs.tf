output "ec2_public_instance_1_public_ip" {
  description = "The public IP address of the public_instance_1 instance."
  value       = aws_instance.public_instance_1.public_ip
}