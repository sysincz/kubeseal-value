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
$ docker run -v <cluster-cert.pem>:/cert.pem hopkinstk/kubeseal-value --cert /cert.pem -n <namespace> --secret-name <name-of-the-secret> --value <value-to-encrypt>
```
**Returns**: encrypted value for a given namespace


### Seal using certificate from Controller

To seal/encrypt without certificate (using one in the Kubernetes cluster) use:
```bash
$ docker run -v ~/.kube/config:/root/.kube/config hopkinstk/kubeseal-value -n <namespace> --secret-name <name-of-the-secret> --value <value-to-encrypt>
```
**Returns**: encrypted value for a given namespace

Similarly whole Kubernetes Secret can be sealed by mapping Kube config `-v ~/.kube/config:/root/.kube/config` instead of mounting certificate `-v <cluster-cert.pem>:/cert.pem` and seting-up the path to it `--cert /cert.pem`.
