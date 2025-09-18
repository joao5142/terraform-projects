terraform {
  required_providers {
    aws = {
      source : "hashicorp/aws",
      version : "5.37.0"
    }
  }
}

#IS Managed by our terraform
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.my_variable
}

#Is Managed somewhere else ,  we just want to use it our project , 
# this get the bucket information from aws
data "aws_s3_bucket" "my_external_bucket" {
  bucket = "my-external-bucket"
}

variable "my_variable" {
  type        = string
  description = "My variable"
  default     = "my_default_bucket_name"
}

output "bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}

locals {
  local_example = "This is a local variable"
}

module "my_module" {
  source = "./module-example"
}