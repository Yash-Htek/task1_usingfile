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
  }
}

provider "snowflake" {
  username   = dotenv.get("SNOWFLAKE_USER")
  password   = dotenv.get("SNOWFLAKE_PASSWORD")
  account    = dotenv.get("SNOWFLAKE_ACCOUNT")
  region     = dotenv.get("SNOWFLAKE_REGION")
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}