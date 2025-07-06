output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.vm.public_ip
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i ${var.key_name}.pem ec2-user@${aws_instance.vm.public_ip}"
}
