terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket = "my-terraform-state-bucket-teeest"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.base_avaliable_zone
}