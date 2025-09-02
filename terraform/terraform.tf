terraform {
  required_version = ">= 1.3.0"

  backend "local" {
    path = "/home/giorgi/projects/nodejs-ci-cd-aws/terraform/terraform.tfstate"
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