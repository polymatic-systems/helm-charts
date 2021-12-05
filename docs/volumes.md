
### volumes

You can create volumes to persist data, share an empty directory across containers in a pod, or mount a file.

```yaml
# default settings

volumes:
- name:
  path:
  pvc:
    class: # the cluster default
    snapshot:
    access:
    - ReadWriteOnce
    size: 1Gi

volumes:
- name:
  path:
  ev: false

volumes:
- name:
  path:
  file: 
  perpetual: 'enable' ('enable', 'disable')
  data:
```

```yaml
# explanations

volumes: <- this set up is for persistent directory volumes
- name: an arbitrary name
  path: the directory path to mount the volume
  pvc:
    class: the storage class
    snapshot: if restoring from a snapshot, the name of the VolumeSnapshot
    access: access modes https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes
    size: the size of the volume

volumes: <- this set up is for ephemeral emptyDir volumes
- name: an arbitrary name
  path: the directory path to mount the volume
  ev: if true, creates an ephemeral emptyDir volume, used for shareing a directory between containers

volumes: <- this set up is for mounting file volumes
- name: an arbitrary name
  path: the directory path to mount the volume
  file: if the volume is a file, put the file name here
  perpetual: whether to retain the pvc if the release is uninstalled
  data:
    file.name: |
      placing a yaml multiline string here will create a secret instead of a volume and mount it as a file
```
