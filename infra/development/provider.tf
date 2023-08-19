terraform {
  required_providers {
    backend "remote" {
      organization = "Shetaya_org"
      workspaces {
        name = "IaC"
      }
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}


