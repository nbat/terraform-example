locals {

  terraform_backend_config_file = format(
  "%s/%s",
  var.terraform_backend_config_file_path,
  var.terraform_backend_config_file_name
  )

  terraform_backend_config_template_file = "${path.module}/templates/backend.tf.tpl"

  bucket_name = var.s3_bucket_name

  policy = data.aws_iam_policy_document.prevent_unencrypted_uploads.json

  tags = var.tags
}