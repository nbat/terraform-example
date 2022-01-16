# Terraform example 
Example terraform infrastructure

## Bootstrapping
Make sure you have created .aws/credentials with default profile

```console
terraform init
```
Downloads Terraform modules and providers.

```console
terraform workspace create new dev
```
Creates new dev workspace

```console
terraform apply -auto-approve -var-file=environments/dev.tfvars
```

This creates the state bucket and DynamoDB locking table. At this point, the Terraform state is still stored locally.

Module terraform_state_backend also creates a new backend.tf file that defines the S3 state backend

```console
terraform init -force-copy -var-file=environments/dev.tfvars
```

Terraform detects that you want to move your Terraform state to the S3 backend, and it does so per -auto-approve. Now the state is stored in the S3 bucket, and the DynamoDB table will be used to lock the state to prevent concurrent modification.

## Destruction
In main.tf, change the terraform_state_backend module arguments as follows:
```hcl-terraform
 module "terraform_state_backend" {
     ...
   terraform_backend_config_file_path = ""
   force_destroy                      = true
 }
```

```console
terraform apply -target module.terraform_state_backend -auto-approve -var-file=environments/dev.tfvars
```
This implements the above modifications by deleting the backend.tf file and enabling deletion of the S3 state bucket.

```console
terraform init -force-copy -var-file=environments/dev.tfvars
```
Terraform detects that you want to move your Terraform state from the S3 backend to local files, and it does so per -auto-approve. Now the state is once again stored locally and the S3 state bucket can be safely deleted.

```console
terraform destroy -var-file=environments/dev.tfvars
```
This deletes all resources in your deployment.

Examine local state file terraform.tfstate to verify that it contains no resources.
