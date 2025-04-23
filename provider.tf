terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.13.1"
    }
  }
  backend "s3" {
    bucket         = "terraform-backend"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock" # Table name 
    encrypt        = true
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "terraform-bala" # add User profile name here
}