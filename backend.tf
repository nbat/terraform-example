terraform {
  required_version = ">= 1.1.3"
  backend "s3" {
    region         = "eu-central-1"
    bucket         = "eu-central-1-terraform-example-terraform-state"
    key            = "dev-terraform-example.tfstate"
    dynamodb_table = "eu-central-1-terraform-example-terraform-state"
    profile        = "default"
    role_arn       = ""
    encrypt        = "true"
  }
}
