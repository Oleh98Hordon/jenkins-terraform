# ---------------Setting for remote_state---------------------
terraform {
  backend "s3" {
    bucket = "terra-bucket-test-for-oleg"
    region = "eu-central-1"
    key = "jenkins/terraform.tfstate"
    }
}
provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}