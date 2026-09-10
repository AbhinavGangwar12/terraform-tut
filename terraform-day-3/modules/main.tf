resource "local_file" "app" {
    content =  "Running application: ${var.app_name}"
    filename = "${path.module}/${var.app_name}.txt"
}
