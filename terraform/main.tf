data "ibm_resource_group" "resource_group" {
   name = var.resource_group
}

resource "random_string" "random" {
  length           = 4
  special          = false
}

locals { 
  project-name = "${var.code_engine_instance_name}-${random_string.random.result}"
}

resource "ibm_code_engine_project" "code_engine_project_instance" {
   name = local.project-name
   resource_group_id = data.ibm_resource_group.resource_group.id
}

data "ibm_code_engine_project" "code_engine_project" {
    project_id = ibm_code_engine_project.code_engine_project_instance.id
}

resource "ibm_code_engine_secret" "code_engine_secret_instance" {
  project_id = ibm_code_engine_project.code_engine_project_instance.id
  name = "flow-logs-to-kafka-secret"
  format = "generic"
    data = {
        ACCESS_KEY_ID = var.access_key_id
        SECRET_ACCESS_KEY = var.secret_access_key
        API_KEY = var.event_streams_api_key
  }
}

resource "ibm_code_engine_config_map" "code_engine_config_map_instance" {
  project_id = ibm_code_engine_project.code_engine_project_instance.id
  name       = "flow-logs-to-kafka-cfgmap"
      data = {
        BOOTSTRAP_SERVERS = var.bootstrap_servers
        COS_BACKUP_BUCKET = var.cos_backup_bucket
        COS_BUCKET = var.cos_bucket
        COS_ENDPOINT = var.cos_endpoint
        KAFKA_TOPIC = var.kafka_topic
        LS_JAVA_OPTS = var.java_options
  }
}

resource null_resource "job_create" {
  provisioner "local-exec" {
      command = <<-EOT
         ibmcloud login --apikey ${var.ibmcloud_api_key} -g ${var.resource_group} -r ${var.region}
         ibmcloud ce project select --name ${local.project-name}
         ibmcloud ce job create -n flow-logs-to-kafka --build-source https://github.com/argeiger/vpc-flow-logs-to-kafka.git --env-cm ${ibm_code_engine_config_map.code_engine_config_map_instance.name} --env-sec ${ibm_code_engine_secret.code_engine_secret_instance.name} -es 0.4G --cpu 1 --memory 4G  --wait
         ibmcloud ce subscription cron create -n flow-logs-to-kafka-subscr --destination flow-logs-to-kafka --destination-type job --schedule '*/15 * * * *'
      EOT
  }    

  depends_on = [ibm_code_engine_config_map.code_engine_config_map_instance, ibm_code_engine_secret.code_engine_secret_instance] 
}
