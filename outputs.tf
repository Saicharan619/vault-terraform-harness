output "instance_name" {
  value = google_compute_instance.vm_instance.name
}
output "gcp_creds_snippet" {
  value     = substr(var.gcp_creds, 0, 100)
  sensitive = true
}
