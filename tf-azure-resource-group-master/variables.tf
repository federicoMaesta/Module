variable tags {
  type = map
}

variable resource_identifier {
  type    = string
  default = ""
}

variable location {
  type = string
}

variable users_contributors {
  type    = list
  default = []
}

variable users_readers {
  type    = list
  default = []
}

variable owners {
  type    = list(string)
  default = []
}

variable create_aad {
  type    = bool
  default = false
}

variable name_override {
  type    = string
  default = null
}

variable rg_count {
  type        = number
  description = "This will either enable or disable the module. Defaults to 1"
  default     = 1
}
