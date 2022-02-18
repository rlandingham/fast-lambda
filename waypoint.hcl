project = "fast-lambda2"

runner {
  enabled = true

  data_source "git" {
    url  = "https://github.com/rlandingham/fast-lambda.git"
  }
}

app "fast-lambda" {
  build {
    use "docker" {
      dockerfile = "docker/Dockerfile"
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
      iam_role = "arn:aws:iam::869442444543:role/fast-lambda-role"
    }
  }

  release {
    use "aws-alb" {
      subnets = ["subnet-0ca652c958d26491e","subnet-0c8ea773a1e54c78c"]
    }
  }
}