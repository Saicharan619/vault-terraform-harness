variable "gcp_creds" {
  description = "Base64 encoded GCP service account key from Vault"
  type        = string
  sensitive   = true
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "vault_address" {
  description = "Vault address (VAULT_ADDR env)"
  type        = string
}

variable "vault_token" {
  description = "Vault token (VAULT_TOKEN env)"
  type        = string
  sensitive   = true
}
