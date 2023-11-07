variable "resource_group" {
    description = "Name of resource group where Code Engine project will be."
    type = string   
}

variable "ibmcloud_api_key" {
    description = "API key for IBM Cloud account."
    type = string    
}

variable "region" {
    description = "Name of target region."
    type = string
}

variable "code_engine_instance_name" {
    description = "Name of code engine instance"
    type = string
    default = "vpc-flow-logs-to-kafka"
}

variable "access_key_id" {
    description = "HMAC access key for the COS instance"
    type = string
}

variable "secret_access_key" {
    description = "HMAC secret access key for the COS instance"
    type = string
}

variable "event_streams_api_key" {
    description = "Provided Event Streams api_key"
    type = string
}

variable "bootstrap_servers" {
    description = "Provided Event Streams broker list"
    type = string
}

variable "cos_backup_bucket" {
    description = "Backup Object Storage bucket to send processed VPC Flow logs"
    type = string
}

variable "cos_bucket" {
    description = "Object Storage bucket that holds the VPC Flow Logs"
    type = string
}

variable "cos_endpoint" {
    description = "Direct endpoint for your Cloud Object Storage bucket"
    type = string
}

variable "kafka_topic" {
    description = "Kafka topic to send the VPC Flow logs"
    type = string
}

variable "java_options" {
    description = "Options for the Java JVM for logstash"
    type = string
    default = "-Xms3g -Xmx3g"
}

