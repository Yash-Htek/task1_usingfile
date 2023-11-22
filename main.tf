terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "Hoonartek"

    workspaces {
      name = "Task1-UsingFile"
    }
    token = var.TF_API_TOKEN
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
