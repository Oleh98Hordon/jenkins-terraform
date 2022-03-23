output "done" {
  value = var.done
}

output "ec2_public_ip" {
  value = ["ssh -i terraform-frankfurt.pem ubuntu@${module.ec2.webinstance[0].public_ip}"]
}