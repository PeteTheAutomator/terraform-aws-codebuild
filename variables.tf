variable "codebuild_project_name" {}

variable "codebuild_project_description" {}

variable "codebuild_image" {
    default = "aws/codebuild/python:2.7.12"
}

variable "codebuild_source_type" {}

variable "codebuild_source_location" {}
