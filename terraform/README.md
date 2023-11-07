# Terraform for VPC Flow logs to Kafka job

The terraform in this directory creates the resources for IBM Cloud Code Engine to invoke the VPC Flow logs to kafka job on a time basis. 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3, < 1.6 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.59.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | >= 1.59.0 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_code_engine_config_map.code_engine_config_map_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/code_engine_config_map) | resource |
| [ibm_code_engine_project.code_engine_project_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/code_engine_project) | resource |
| [ibm_code_engine_secret.code_engine_secret_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/code_engine_secret) | resource |
| [null_resource.job_create](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [ibm_code_engine_project.code_engine_project](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/code_engine_project) | data source |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_id"></a> [access\_key\_id](#input\_access\_key\_id) | HMAC access key for the COS instance | `string` | n/a | yes |
| <a name="input_bootstrap_servers"></a> [bootstrap\_servers](#input\_bootstrap\_servers) | Provided Event Streams broker list | `string` | n/a | yes |
| <a name="input_code_engine_instance_name"></a> [code\_engine\_instance\_name](#input\_code\_engine\_instance\_name) | Name of code engine instance | `string` | `"vpc-flow-logs-to-kafka"` | no |
| <a name="input_cos_backup_bucket"></a> [cos\_backup\_bucket](#input\_cos\_backup\_bucket) | Backup Object Storage bucket to send processed VPC Flow logs | `string` | n/a | yes |
| <a name="input_cos_bucket"></a> [cos\_bucket](#input\_cos\_bucket) | Object Storage bucket that holds the VPC Flow Logs | `string` | n/a | yes |
| <a name="input_cos_endpoint"></a> [cos\_endpoint](#input\_cos\_endpoint) | Direct endpoint for your Cloud Object Storage bucket | `string` | n/a | yes |
| <a name="input_event_streams_api_key"></a> [event\_streams\_api\_key](#input\_event\_streams\_api\_key) | Provided Event Streams api\_key | `string` | n/a | yes |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | API key for IBM Cloud account. | `string` | n/a | yes |
| <a name="input_java_options"></a> [java\_options](#input\_java\_options) | Options for the Java JVM for logstash | `string` | `"-Xms3g -Xmx3g"` | no |
| <a name="input_kafka_topic"></a> [kafka\_topic](#input\_kafka\_topic) | Kafka topic to send the VPC Flow logs | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Name of target region. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Name of resource group where Code Engine project will be. | `string` | n/a | yes |
| <a name="input_secret_access_key"></a> [secret\_access\_key](#input\_secret\_access\_key) | HMAC secret access key for the COS instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Code engine instance project id |
<!-- END_TF_DOCS -->