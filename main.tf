resource "aws_iam_role" "codebuild_role" {
  name = "codebuild-role-"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "codebuild_policy" {
  name        = "codebuild-policy"
  path        = "/service-role/"
  description = "Policy used in trust relationship with CodeBuild"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "codebuild_policy_attachment" {
  name       = "codebuild-policy-attachment"
  policy_arn = "${aws_iam_policy.codebuild_policy.arn}"
  roles      = ["${aws_iam_role.codebuild_role.id}"]
}

# TODO: move this policy attachment out - anything but the bare minimum must be handled externally (by the consumer)
resource "aws_iam_policy_attachment" "codebuild_policy_attachment2" {
  name       = "codebuild-policy-attachment2"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  roles      = ["${aws_iam_role.codebuild_role.id}"]
}

resource "aws_codebuild_project" "foo" {
  name         = "${var.codebuild_project_name}"
  description  = "${var.codebuild_project_description}"
  build_timeout      = "5"
  service_role = "${aws_iam_role.codebuild_role.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "${var.codebuild_image}"
    type         = "LINUX_CONTAINER"

#    environment_variable {
#      "name"  = "SOME_KEY1"
#      "value" = "SOME_VALUE1"
#    }
#
#    environment_variable {
#      "name"  = "SOME_KEY2"
#      "value" = "SOME_VALUE2"
#    }
  }

  source {
    type     = "${var.codebuild_source_type}"
    location = "${var.codebuild_source_location}"
  }

  tags {
    "Environment" = "Test"
  }
}
