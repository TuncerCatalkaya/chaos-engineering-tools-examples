# Kube Monkey
Kube monkey is a chaos engineering tool that can only kill pods. For further information
check out the [kube-monkey repository](kube-monkey) (repo is linked as a submodule).

In the [pod-kill-experiment directory](pod-kill-experiment) is explained how to run such
an experiment for kube-monkey.

## Description of the files in this directory
The following files, which are placed in this directory, are used for all the
chaos engineering experiments for kube-monkey.

### microservices.yaml
This file is the same as the one from the [microservice-kubernetes-demo](../../microservice-kubernetes-demo),
but with the addition of the opt-in labels from kube-monkey.

### Demo kube-monkey deploy script
Deployment script to deploy the demo application with kube-monkey in a Kubernetes Cluster.

### Demo kube-monkey delete script
Delete script to teardown the Kubernetes Cluster that was deployed from the deployment script.

## How to run the Kubernetes Cluster
First start minikube.
```shell
minikube start --memory=4000  # Can also add --cpu NUMBER_OF_CPUS
                              # --driver=docker should automatically be used
```
Check if minikube launched properly.
```shell
kubectl config current-context # Should return minikube as current context
```
Run the deployment script.
```shell
~/chaos-engineering-tools-examples/tools/kube-monkey-tool/demo-kube-monkey-deploy.sh
```
Check the status of pods/services.
```shell
kubectl get pods                # get pods from default namespace
kubectl get svc                 # get services from default namespace
kubectl get pods -n kube-monkey # get pods from kube-monkey
```
Check helm deployment status.
```shell
helm ls -n kube-monkey
```
Check logs of kube-monkey (start a separate terminal or open another tab).
```shell
kubectl logs -n kube-monkey -l release=kube-monkey -f
```