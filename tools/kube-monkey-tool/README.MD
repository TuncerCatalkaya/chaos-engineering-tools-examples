# Kube Monkey
Kube monkey is a chaos engineering tool that can only kill pods. For further information
check out the kube-monkey repository (linked as a submodule in this directory).

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
Assuming you are using the [vm](../vm/) in this repository.

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
kubectl get pods -n kube-monkey # get pods from kube-monkey namespace
```
Check helm deployment status.
```shell
helm ls -n kube-monkey
```
Access demo application frontend  (start a separate terminal or open another tab for each command).
```shell
chromium # Start chromium (can be any browser)
```
```shell
kubectl port-forward deploy/apache 8081:80 # Frontend can be accessed at -> localhost:8081
```

## How to stop the Kubernetes Cluster
Assuming you are using the [vm](../vm/) in this repository.

Run the delete script.
```shell
~/chaos-engineering-tools-examples/tools/kube-monkey-tool/demo-kube-monkey-delete.sh
```
Check the status of pods/services.
```shell
kubectl get pods                # get pods from default namespace
kubectl get svc                 # get services from default namespace
kubectl get pods -n kube-monkey # get pods from kube-monkey namespace
```
Check helm deployment status.
```shell
helm ls -n kube-monkey
```
Stop/Delete minikube. Only required when you are done with all the Kubernetes experiments.
```shell
minikube stop
minikube delete
```