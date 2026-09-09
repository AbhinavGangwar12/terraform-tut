# Explicit-dependeny
/*
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

resource "local_file" "audit_complete" {
    content = "Audit Finished."
    filename = "${path.module}/audit.txt"
    depends_on = [
        local_file.welcome,
        local_file.admin_log
    ]
}

output "welcome_success" {
    value = "${local_file.welcome.content}"
    description = "Printing a success messsage for welcome file."
}
output "admin_success" {
    value = "${local_file.admin_log.filename}"
    description = "Log registered."
}
*/

/*
# Loops


# count implementation
resource "local_file" "workers" {
    count = 3
    content = "This is worker node ${count.index}"
    filename = "${path.module}/workers/worker-${count.index}.txt"
}


# for_each implementation - applies the resource over an iterable

variable "roles" {
    type = set(string)
    default = ["api", "web", "db"]
}

resource "local_file" "role_files" {
    for_each = var.roles 
    content = "This is ${each.key} role"
    filename = "${path.module}/roles/${each.key}-config.txt"
}

*/