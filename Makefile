install-terraform:
brew install terraform

init:
terraform init

plan-development:
terraform plan --var-file=variables.development.tfvars

plan-production:
terraform plan --var-file=variables.production.tfvars

apply-development:
terraform apply --var-file=variables.development.tfvars

apply-production:
terraform apply --var-file=variables.production.tfvars

destroy-development:
terraform apply --var-file=variables.development.tfvars

destroy-production:
terraform apply --var-file=variables.production.tfvars