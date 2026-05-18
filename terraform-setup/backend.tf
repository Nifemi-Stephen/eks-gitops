terraform {
  backend "s3" {
    bucket         = "devops-project-terraform-state-nifemi"
    key            = "devops-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
