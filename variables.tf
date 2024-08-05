variable "kubeconfig-path" {
  description = "Kubeconfig Path"
  type        = string
  default     = "~/.kube/config"
}

variable "istio-system-namespace" {
  description = "Istio System Namespace"
  type        = string
  default     = "istio-system"
}

variable "istio-ingress-namespace" {
  description = "Istio Ingress Namespace"
  type        = string
  default     = "istio-ingress"
}

variable "helm-name" {
  description = "Helm Release Name"
  type        = map(string)
  default = {
    istio-base            = "base"
    istiod                = "istiod"
    istio-ingress-gateway = "gateway"
    peerauthentication    = "peerauthentication"
  }
}

variable "helm-chart-name" {
  description = "Helm Chart Name"
  type        = map(string)
  default = {
    istio-base            = "base"
    istiod                = "istiod"
    istio-ingress-gateway = "gateway"
    peerauthentication    = "custom-manifest"
  }
}

variable "helm-chart-repo" {
  description = "Helm Chart Repo"
  type        = map(string)
  default = {
    istio           = "https://istio-release.storage.googleapis.com/charts"
    custom-manifest = "https://puhhh.github.io/pages-helm-repo/"
  }
}

variable "helm-chart-version" {
  description = "Helm Chart Version"
  type        = map(string)
  default = {
    istio           = "1.22.2"
    custom-manifest = "0.0.1"
  }
}

variable "helm-custom-values" {
  description = "Use Helm Custom Values"
  type        = bool
  default     = false
}

variable "helm-custom-values-path" {
  description = "Helm Custom Values Path"
  type        = map(string)
  default = {
    istio-base            = ""
    istiod                = ""
    istio-ingress-gateway = ""
    peerauthentication    = ""
  }
}

variable "peerauthentication-mode" {
  description = "PeerAuthentication Mode"
  type        = string
  default     = "STRICT"
}
