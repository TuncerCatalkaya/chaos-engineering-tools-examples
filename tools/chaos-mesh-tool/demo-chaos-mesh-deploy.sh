#!/bin/sh
kubectl apply -f  ~/chaos-engineering-tools-examples/tools/chaos-mesh-tool/microservices.yaml
kubectl create -f ~/chaos-engineering-tools-examples/tools/chaos-mesh-tool/chaos-mesh/manifests/crd.yaml
kubectl create ns chaos-mesh
helm upgrade --install chaos-mesh ~/chaos-engineering-tools-examples/tools/chaos-mesh-tool/chaos-mesh/helm/chaos-mesh \
	-n chaos-mesh \
	--set dashboard.create=true \
	--set dashboard.securityMode=false
