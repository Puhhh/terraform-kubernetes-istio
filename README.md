<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.15.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.istio-base](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.istio-cni](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.istio-gateway](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.istio-ingress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.istiod](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.peerauthentication](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.istio-namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_helm-chart-name"></a> [helm-chart-name](#input\_helm-chart-name) | Helm Chart Name | `map(string)` | <pre>{<br>  "istio-base": "base",<br>  "istio-cni": "cni",<br>  "istio-gateway": "custom-manifest",<br>  "istio-ingress": "gateway",<br>  "istiod": "istiod",<br>  "peerauthentication": "custom-manifest"<br>}</pre> | no |
| <a name="input_helm-chart-repo"></a> [helm-chart-repo](#input\_helm-chart-repo) | Helm Chart Repo | `map(string)` | <pre>{<br>  "custom-manifest": "https://puhhh.github.io/pages-helm-repo/",<br>  "istio": "https://istio-release.storage.googleapis.com/charts"<br>}</pre> | no |
| <a name="input_helm-chart-version"></a> [helm-chart-version](#input\_helm-chart-version) | Helm Chart Version | `map(string)` | <pre>{<br>  "custom-manifest": "0.0.1",<br>  "istio": "1.22.2"<br>}</pre> | no |
| <a name="input_helm-custom-values"></a> [helm-custom-values](#input\_helm-custom-values) | Use Helm Custom Values | `bool` | `false` | no |
| <a name="input_helm-custom-values-path"></a> [helm-custom-values-path](#input\_helm-custom-values-path) | Helm Custom Values Path | `map(string)` | <pre>{<br>  "istio-base": "",<br>  "istio-gateway": "",<br>  "istio-ingress": "",<br>  "istiod": "",<br>  "peerauthentication": ""<br>}</pre> | no |
| <a name="input_helm-name"></a> [helm-name](#input\_helm-name) | Helm Release Name | `map(string)` | <pre>{<br>  "istio-base": "base",<br>  "istio-cni": "istio-cni",<br>  "istio-gateway": "istio-gateway",<br>  "istio-ingress": "gateway",<br>  "istiod": "istiod",<br>  "peerauthentication": "peerauthentication"<br>}</pre> | no |
| <a name="input_istio-ingress-gateway"></a> [istio-ingress-gateway](#input\_istio-ingress-gateway) | Create Istio Ingress Gateway | `bool` | `false` | no |
| <a name="input_istio-ingress-gateway-name"></a> [istio-ingress-gateway-name](#input\_istio-ingress-gateway-name) | Istio Ingress Gateway Name | `string` | `"gateway"` | no |
| <a name="input_istio-ingress-namespace"></a> [istio-ingress-namespace](#input\_istio-ingress-namespace) | Istio Ingress Namespace | `string` | `"istio-ingress"` | no |
| <a name="input_istio-system-namespace"></a> [istio-system-namespace](#input\_istio-system-namespace) | Istio System Namespace | `string` | `"istio-system"` | no |
| <a name="input_kube-context"></a> [kube-context](#input\_kube-context) | Kubernetes Context to Use | `string` | `""` | no |
| <a name="input_kubeconfig-path"></a> [kubeconfig-path](#input\_kubeconfig-path) | Kubeconfig Path | `string` | `"~/.kube/config"` | no |
| <a name="input_namespace-labels"></a> [namespace-labels](#input\_namespace-labels) | Namespace Labels | `map(string)` | <pre>{<br>  "pod-security.kubernetes.io/enforce": "privileged"<br>}</pre> | no |
| <a name="input_peerauthentication-mode"></a> [peerauthentication-mode](#input\_peerauthentication-mode) | PeerAuthentication Mode | `string` | `"STRICT"` | no |
| <a name="input_use-istio-cni"></a> [use-istio-cni](#input\_use-istio-cni) | Use Istio CNI to configure traffic redirection for pods in the mesh | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
