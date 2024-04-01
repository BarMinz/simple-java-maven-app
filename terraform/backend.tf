backend "s3" {
  bucket  = "bar-terraform-github-actions"
  key     = "terraform.tfstate"
  region  = "eu-north-1"
}