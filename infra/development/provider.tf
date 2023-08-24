terraform {
  backend "remote" {
    organization = "Shetaya_org"
    workspaces {
      name = "IaC-Dev"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}


