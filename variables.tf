variable "region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "GCP zone"
  default     = "us-central1-a"
}

variable "vault_address" {
  type        = string
  description = "Vault server URL (e.g., http://34.93.44.120:8200)"
}

variable "vault_token" {
  type        = string
  description = "Vault token with access to secret/gcpcred"
  sensitive   = true
}
