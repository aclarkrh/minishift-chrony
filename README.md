# minishift-chrony

Simple container to fix the persistent time drift problem running minishift. Deploys a pod running `chronyd` which monitors and syncs time differences.


## How to use

To deploy:

```
oc import-image my-rhel7/rhel --from=registry.access.redhat.com/rhel7/rhel --confirm -n openshift

oc project <some-project>

oc process -f minishift-chrony-template.yaml | oc apply -f -

oc adm policy add-scc-to-user privileged -z minishift-chrony

oc start-build minishift-chrony
```

To remove and tidy up:
```
oc delete all -l app=minishift-chrony

oc delete sa -l app=minishift-chrony
```