output "ec2_hello_world_instance_public_ip" {
  description = "The public IP address of the hello-world instance."
  value       = aws_instance.hello_world.public_ip
}