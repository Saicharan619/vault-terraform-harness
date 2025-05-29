variable "gcp_creds" {
  description = "GCP service account JSON credentials (base64 encoded)"
  type        = string
  sensitive   = true
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default = saicharan-457910
}

variable "vault_address" {
  description = "Vault server address"
  type        = string
}

variable "vault_token" {
  description = "Vault access token"
  type        = string
  sensitive   = true
}
