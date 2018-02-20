terraform-aws-codebuild
=======================

Description
-----------

Terraform module to provision/manage an AWS CodeBuild project.


Usage
-----

Example:

```
module "codebuild" {
    source = "github.com/PeteTheAutomator/terraform-aws-codebuild"
    codebuild_project_name = "boo"
    codebuild_project_description = "testing terraform 1"
    codebuild_source_type = "GITHUB"
    codebuild_source_location = "https://github.com/PeteTheAutomator/AMIBuild.git"
}
```

