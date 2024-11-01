variable "kubeconfig-path" {
  description = "Kubeconfig Path"
  type        = string
  default     = "~/.kube/config"
}

variable "kube-context" {
  description = "Kubernetes Context to Use"
  type        = string
  default     = ""
}

variable "istio-system-namespace" {
  description = "Istio System Namespace"
  type        = string
  default     = "istio-system"
}

variable "namespace-labels" {
  description = "Namespace Labels"
  type        = map(string)
  default = {
    "pod-security.kubernetes.io/enforce" = "privileged"
  }
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
    istio-base         = "base"
    istiod             = "istiod"
    istio-ingress      = "gateway"
    peerauthentication = "peerauthentication"
    istio-cni          = "istio-cni"
    istio-gateway      = "istio-gateway"
  }
}

variable "helm-chart-name" {
  description = "Helm Chart Name"
  type        = map(string)
  default = {
    istio-base         = "base"
    istiod             = "istiod"
    istio-ingress      = "gateway"
    peerauthentication = "custom-manifest"
    istio-cni          = "cni"
    istio-gateway      = "custom-manifest"
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
    istio-base         = ""
    istiod             = ""
    istio-ingress      = ""
    peerauthentication = ""
    istio-gateway      = ""
  }

  validation {
    condition     = !(var.helm-custom-values && var.helm-custom-values-path["istio-base"] == "" && var.helm-custom-values-path["istiod"] == "" && var.helm-custom-values-path["istio-ingress"] == "" && var.helm-custom-values-path["peerauthentication"] == "" && var.helm-custom-values-path["istio-gateway"] == "")
    error_message = "helm-custom-values-path must not be null when helm-custom-values is true."
  }
}

variable "peerauthentication-mode" {
  description = "PeerAuthentication Mode"
  type        = string
  default     = "STRICT"
}

variable "istio-ingress-gateway" {
  description = "Create Istio Ingress Gateway"
  type        = bool
  default     = false
}

variable "istio-ingress-gateway-name" {
  description = "Istio Ingress Gateway Name"
  type        = string
  default     = "gateway"
}

variable "use-istio-cni" {
  description = "Use Istio CNI to configure traffic redirection for pods in the mesh"
  type        = bool
  default     = false
}
