resource "shoreline_notebook" "nginx_file_upload_size_limit_exceeded_incident" {
  name       = "nginx_file_upload_size_limit_exceeded_incident"
  data       = file("${path.module}/data/nginx_file_upload_size_limit_exceeded_incident.json")
  depends_on = [shoreline_action.invoke_nginx_max_size_update]
}

resource "shoreline_file" "nginx_max_size_update" {
  name             = "nginx_max_size_update"
  input_file       = "${path.module}/data/nginx_max_size_update.sh"
  md5              = filemd5("${path.module}/data/nginx_max_size_update.sh")
  description      = "Increase the maximum file upload size limit of Nginx server to accommodate larger files."
  destination_path = "/tmp/nginx_max_size_update.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_nginx_max_size_update" {
  name        = "invoke_nginx_max_size_update"
  description = "Increase the maximum file upload size limit of Nginx server to accommodate larger files."
  command     = "`chmod +x /tmp/nginx_max_size_update.sh && /tmp/nginx_max_size_update.sh`"
  params      = ["NGINX_CONF_PATH","NEW_MAX_SIZE"]
  file_deps   = ["nginx_max_size_update"]
  enabled     = true
  depends_on  = [shoreline_file.nginx_max_size_update]
}

