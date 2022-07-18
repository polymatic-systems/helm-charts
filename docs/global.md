
### global

These settings define behaviour of the deployment or the default behavior of all cronjobs.

```yaml
# default settings

annotations:
priority: ('low', 'mid', 'high', 'core', 'database', 'critical')
restart: Always ('Always', 'OnFailure', 'Never')
share: false
remote:
nodes:
  prohibit:
  force:
add:
  logs:
  metrics:
  mesh:
pipe:
```

```yaml
# explanations

annotations: additional deployment/cronjob annotations
priority: the pod priority class
restart: the restart policy for the pod
share: whether containers in the pod should share a process namespace
remote: key/value map of externalName services. CNAME will be NAME-KEY.NAMESPACE.svc.cluser.local -> VALUE
nodes:
  prohibit: map of key/value node labels that pods should never run on
  force: map of key/value node labels that pods have to run on
add:
  logs: adds logs annotations if defined in default section
  metrics: adds metrics annotations if defined in default section
  mesh: adds service mesh annotations if defined in default section
pipe: this can host anything you want, it is not checked by validation, it is for custom values used outside this chart
```
