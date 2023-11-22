terraform {
 backend "remote" {
  organization = "your-organization-name"
  
  workspaces {
    name = "your-workspace-name"
  }
  hostname    = "app.terraform.io"
  credentials = "~/.terraform.d/credentials.tfrc.json"
}

}

provider "snowflake" {
  username   = var.SNOWFLAKE_USER
  password   = var.SNOWFLAKE_PASSWORD
  account    = var.SNOWFLAKE_ACCOUNT
  region     = var.SNOWFLAKE_REGION
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

// Additional resources and configurations can go here
