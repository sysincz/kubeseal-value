# Kubeseal Value
Allows to create [**"Sealed Secret"**](https://github.com/bitnami-labs/sealed-secrets) using Bitnami `kubeseal` by encrypting Kubernetes Secret
as well as encrypt a single value for a given namespace for a later use in a generated Sealed Secret e.g. in [HELM Chart](https://docs.helm.sh/developing_charts).

## Seal whole Kubernetes Secret

To seal a [**Kubernetes Secret**](https://kubernetes.io/docs/concepts/configuration/secret/), you can use standard `kubeseal` syntax:
```bash
$ docker run -i -v <cluster-cert.pem>:/cert.pem hopkinstk/kubeseal-value --cert /cert.pem -n <namespace> < <secret.yaml>
```
**Returns**: whole Sealed Secret


## Seal single value

To seal/encrypt a single value for use in **Sealed Secret** use:
```bash
$ docker run -v <cluster-cert.pem>:/cert.pem hopkinstk/kubeseal-value --cert /cert.pem -n <namespace> --value <value-to-encrypt>
```
**Returns**: encrypted value for a given namespace