resource "kubernetes_namespace" "istio-namespace" {
  metadata {
    name = var.istio-system-namespace
  }
}

resource "helm_release" "istio-base" {
  namespace  = kubernetes_namespace.istio-namespace.metadata[0].name
  name       = var.helm-name["istio-base"]
  chart      = var.helm-chart-name["istio-base"]
  repository = var.helm-chart-repo["istio"]
  version    = var.helm-chart-version["istio"]

  values = var.helm-custom-values ? [file("${var.helm-custom-values-path["istio-base"]}")] : []

}

resource "helm_release" "istiod" {
  namespace  = kubernetes_namespace.istio-namespace.metadata[0].name
  name       = var.helm-name["istiod"]
  chart      = var.helm-chart-name["istiod"]
  repository = var.helm-chart-repo["istio"]
  version    = var.helm-chart-version["istio"]

  values = var.helm-custom-values ? [file("${var.helm-custom-values-path["istiod"]}")] : []
}

resource "helm_release" "istio-ingress" {
  create_namespace = var.istio-ingress-namespace == kubernetes_namespace.istio-namespace.metadata[0].name ? false : true
  namespace        = var.istio-ingress-namespace
  name             = var.helm-name["istio-ingress"]
  chart            = var.helm-chart-name["istio-ingress"]
  repository       = var.helm-chart-repo["istio"]
  version          = var.helm-chart-version["istio"]

  values = var.helm-custom-values ? [file("${var.helm-custom-values-path["istio-ingress"]}")] : []
}

resource "helm_release" "peerauthentication" {
  depends_on = [helm_release.istio-base]

  namespace  = kubernetes_namespace.istio-namespace.metadata[0].name
  name       = var.helm-name["peerauthentication"]
  chart      = var.helm-chart-name["peerauthentication"]
  repository = var.helm-chart-repo["custom-manifest"]
  version    = var.helm-chart-version["custom-manifest"]

  values = var.helm-custom-values ? [
    "${templatefile("${var.helm-custom-values-path["peerauthentication"]}", {
      namespace = kubernetes_namespace.istio-namespace.metadata[0].name,
      mode      = var.peerauthentication-mode
    })}"
  ] : []
}

resource "kubernetes_manifest" "gateway" {
  depends_on = [helm_release.istio-ingress]

  count = var.istio-ingress-gateway == true ? 1 : 0

  manifest = {
    "apiVersion" = "networking.istio.io/v1"
    "kind"       = "Gateway"
    "metadata" = {
      "name"      = var.istio-ingress-gateway-name
      "namespace" = var.istio-ingress-namespace
    }
    "spec" = {
      "selector" = {
        "istio" = var.istio-ingress-namespace
      }
      "servers" = [
        {
          "hosts" = [
            "*",
          ]
          "port" = {
            "name"     = "http"
            "number"   = 80
            "protocol" = "HTTP"
          }
          "tls" = {
            "httpsRedirect" = true
          }
        },
      ]
    }
  }
}
