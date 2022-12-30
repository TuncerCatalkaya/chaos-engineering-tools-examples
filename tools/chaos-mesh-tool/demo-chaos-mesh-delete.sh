#!/bin/sh
kubectl delete -f ~/chaos-engineering-tools-examples/tools/chaos-mesh-tool/chaos-mesh/manifests/crd.yaml
helm delete chaos-mesh -n chaos-mesh
kubectl delete ns chaos-mesh
kubectl delete -f  ~/chaos-engineering-tools-examples/tools/chaos-mesh-tool/microservices.yaml
#kubectl patch crd/podchaos.chaos-mesh.org -p '{"metadata":{"finalizers":[]}}' --type=merge
