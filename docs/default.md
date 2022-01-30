
### default

The default fields are designed to assist in automating deployments through a CI/CD pipeline. If used in this way, developers should never directly override the values set here by their pipeline.

```yaml
# default settings

default:
  name:
  version:
  image:
  slug:
  env: production
  namespaced: true
  issuer:
    production: production
    staging: staging
  ingress:
    external: external
    internal: internal
  registries:
  add:
    logs:
    metrics:
    mesh:
```

```yaml
# explanations

default:
  name: an arbitrary name for naming resources
  version: your app version, set as a deployment label
  image: the default container image to use
  slug: an arbitrary string prefixed to the `name` for review environments. if set, will set the certificate issuer to staging
  env: sets the default ingressClassName, 'production' -> .default.ingress.external
  namespaced: 'true' creates namespaced Role/RoleBindings, 'false' creates ClusterRole,ClusterRoleBindings
  issuer:
    production: the name of your production cert-manager Issuer
    staging: the name of your staging cert-manager Issuer
  ingress:
    external: the ingressClassName of your public ingress controller
    internal: the ingressClassName of your private ingress controller
  registries: an array of registry secret names to add to deployments/cronjobs
  add: hosts convenient short keys for adding annotations
    logs: a map of keys to annotations
    metrics: a map of keys to annotations
    mesh: a map of keys to annotations
```
