
provider "aws" {
  region  = var.aws_region
  profile = "xevis4"

  default_tags {
    tags = {
      provision-by = var.provisioner
      env          = var.env_name
    }
  }
}
