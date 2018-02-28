terraform-aws-codebuild
=======================

Description
-----------

Terraform module to provision/manage an AWS CodeBuild project.


Example Usage
-------------

```
module "codebuild" {
    source = "github.com/PeteTheAutomator/terraform-aws-codebuild"
    codebuild_project_name = "AMIBuild-Testing"
    codebuild_project_description = "POC for AMI Build Pipeline"
    codebuild_source_type = "GITHUB"
    codebuild_source_location = "https://github.com/PeteTheAutomator/AMIBuild.git"
    codebuild_image = "docker.io/petetheautomator/ansible"
    codebuild_vpc_id = "vpc-d1a64fb8"
    codebuild_subnets = ["subnet-5a2a3a21"]
    codebuild_security_group_ids = ["sg-902c74f8"]
}
```

Inputs
------

**codebuild_project_name** - (Required) The projects name.

**codebuild_project_description** - (Optional) A short description of the project.

**codebuild_source_type** - (Required) The type of repository that contains the source code to be built. Valid values for this parameter are: CODECOMMIT, CODEPIPELINE, GITHUB, BITBUCKET or S3.

**codebuild_source_location** - (Required) Information about the project's input source code.

**codebuild_image** -  (Required) The image identifier of the Docker image to use for this build project [list of Docker images provided by AWS CodeBuild.](https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html). You can read more about the AWS curated environment images in the documentation.

**codebuild_vpc_id** - (Required) The ID of the VPC within which to run builds.

**codebuild_subnets** - (Required) The subnet IDs within which to run builds.

**codebuild_security_group_ids** - (Required) The security group IDs to assign to running builds.


Outputs
-------

**codebuild_role_id** - ID of the IAM Role assigned to the CodeBuild Project
