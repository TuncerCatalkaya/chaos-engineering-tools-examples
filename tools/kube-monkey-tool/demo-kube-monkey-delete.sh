#!/bin/sh
helm delete kube-monkey -n kube-monkey
kubectl delete ns kube-monkey
kubectl delete -f ~/chaos-engineering-tools-examples/tools/kube-monkey-tool/microservices.yaml
