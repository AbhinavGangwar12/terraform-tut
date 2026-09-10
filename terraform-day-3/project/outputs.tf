output "container_spun_postgres" {
    value = "container spun for ${module.db.image_name}"
    description = "Running Message!"
}
output "container_spun_nginx" {
    value = "container spun for ${module.web.image_name}"
    description = "Running Message!"
}