# Basic Syntax to write a resource
# resource "PROVIDER_TYPE" "YOUR_INTERNAL_NAME" {
#  argument1 = "value1"
#  argument2 = "value2"
# }

/*
resource "local_file" "first-file" {
  content  = "Yo! I'm here to conquer terraform."
  filename = "${path.module}/first-file.txt"
}
*/
/*
variable "file_name" {
    type = string
    default = "first-dynamic-file"
}

variable "user" {
    type = string
    default = "John Doe"
}

resource "local_file" "dynamic_file" {
    content = "Hi, the file ${var.file_name} is created by ${var.user} using terraform."
    filename = "${path.module}/${var.file_name}"
}

output "success_message" {
    value = "We just created a file for ${var.user}"
    description = "Print a success message"
}
*/

variable "username" {
    type = string
    default = "Mike"
}
variable "env" {
    type = string
    default = "dev"
}

resource "local_file" "welcome" {
    content = "Welcome ${var.username} to the ${var.env} environment!"
    filename = "${path.module}/welcome.txt"
}
resource "local_file" "admin_log" {
    content =  "Admin log created for ${var.username}."
    filename = "${path.module}/admin-log.txt"
}

output "welcome_success" {
    value = "${local_file.welcome.content}"
    description = "Printing a success messsage for welcome file."
}
output "admin_success" {
    value = "${local_file.admin_log.filename}"
    description = "Log registered."
}
