project = "fast-lambda"

runner {
  enabled = true

  data_source "git" {
    url  = "https://github.com/rlandingham/fast-lambda.git"
  }
}

app "fast-lambda" {
  build {
    use "pack" {
    }

    registry {
      use "aws-ecr" {
        region = "us-west-2"
        repository = "fast-lambda"
        tag = "fast-lambda"
      }
    }
  }

  deploy {
    use "aws-lambda" {
      region = "us-west-2"
    }
  }

  release {
    use "aws-alb" {
      domain_name = "fast-lambda.dev.mpulsemobile.com"
      subnets = ["subnet-0ca652c958d26491e","subnet-0c8ea773a1e54c78c"]
      zone_id = "Z08241733RWEZ7H7NGLQH"
    }
  }
}