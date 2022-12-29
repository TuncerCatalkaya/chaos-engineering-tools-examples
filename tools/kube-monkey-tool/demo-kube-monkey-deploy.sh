#!/bin/sh
kubectl apply -f  ~/chaos-engineering-tools-examples/tools/kube-monkey-tool/microservices.yaml
kubectl create ns kube-monkey
helm upgrade --install kube-monkey ~/chaos-engineering-tools-examples/tools/kube-monkey-tool/kube-monkey/helm/kubemonkey \
	-n kube-monkey \
	--set config.debug.enabled=true \
	--set config.debug.schedule_immediate_kill=true \
	--set config.dryRun=false
