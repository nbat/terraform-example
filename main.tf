module "terraform_state_backend" {
  source = "./modules/tfstate-backend"

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"

  force_destroy        = true
  dynamo_db_table_name = "${var.region}-${var.repo_name}-${var.namespace}-terraform-state"
  region               = var.region
  profile              = var.aws_profile
  terraform_state_file = "${var.environment}.tfstate"
  s3_bucket_name       = "${var.region}-${var.repo_name}-${var.namespace}-terraform-state"
  tags                 = local.tags
}
