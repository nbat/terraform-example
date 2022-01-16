resource "local_file" "terraform_backend_config" {
  count           = var.terraform_backend_config_file_path != "" ? 1 : 0
  content         = data.template_file.terraform_backend_config.rendered
  filename        = local.terraform_backend_config_file
  file_permission = "0644"
}
