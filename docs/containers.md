
### containers

These settings define the containers in your deployment or cronjobs.

```yaml
# default settings

containers:
- name: `.default.name`
  image: '.default.image'
  command:
  - ...
  policy: 'Always' ('Always', 'Never', 'IfNotPresent')
  restart: 'Always' ('Always', 'Never', 'OnFailure')
  ports:
  - containerPort: 80
  cpu:
    request: '100m'
    limit: '1000m'
  memory:
    request: '128Mi'
    limit: '1Gi'
  probe:
    path: '/health'
    port: 80
    exec:
    delay:  30
    startup: 20
  root: false
  privileged: false

init:
- (uses the same defaults as used by the 'containers' field)
```

```yaml
# explanations

containers: an array of containers to launch
- name: an arbitrary name for naming resources
  image: the container image
  command: an array of commands to run in the container's shell instead of it's CMD
  - https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#container-v1-core
  policy: the image pull policy
  restart: the restart policy to use for if the container exits
  ports: what ports on the container to expose
  - https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#containerport-v1-core
  cpu:
    request: cpu request is guaranteed
    limit: container will be throttled at cpu limit
  memory:
    request: memory request is guaranteed
    limit: container will be restarted at memory limit
  probe:
    path: the server path to ping for health checks, set to "disable" to disable checks
    port: the server port to ping for health checks
    exec: an array of strings that run a command on the container instead of checking an http endpoint
    delay: number of seconds to wait before liveliness and readiness probes start
    startup: number of failed startup checks before restarting, checks start after 10 seconds and happen every 6 seconds
  root: run the image as root
  privileged: give the image 'privileged' permissions

init: an array of 'init' containers to launch. they run before the containers are started
- (everything you can define under "containers" you can also define under "init")
```
