provider "aws" {
  region  = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.33.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "strapiappterraform-backend"
    key    = "strapiapp.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}
resource "aws_ecr_repository" "myrepo" {
  name                 = "strapiapp"

  image_scanning_configuration {
    scan_on_push = true
  }
}