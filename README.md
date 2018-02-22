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
}
```

Inputs
------

**codebuild_project_name** - The name to give the CodeBuild Project
**codebuild_project_description** - Description to give the CodeBuild Project
**codebuild_source_type** - 
**codebuild_source_location** - 
**codebuild_image** -


Outputs
-------

**codebuild_role_id** - ID of the IAM Role assigned to the CodeBuild Project


Known Issues
------------

Terraform does not presently support VPC configuration (or subnet & security_groups) - until it does, they require manual configuration using the AWS Console.
