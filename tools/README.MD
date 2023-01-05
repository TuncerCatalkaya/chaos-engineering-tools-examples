# Chaos Engineering Tools
In this directory are the chaos engineering tools listed that are
used for the defined experiments.

## Experiments
The experiments are performed on the
[microservice-kubernetes-demo](../microservices-demo).

If the experiment cant be run with the planned experiment criteria, then the
next best settings to get as close as possible to the planned experiment are used.

So far only one experiment is defined. Which is the
**pod-kill-experiment**. It consists of the following points:
* Run every minute
* Kill one pod that is opted-in -> customer-service or order-service

## Tools
The following tools are used for the defined experiments.

### Chaos Mesh
The experiments for chaos-mesh can be found in the
[chaos-mesh-tool directory](chaos-mesh-tool).

### Kube Monkey
The experiments for kube-monkey can be found in the
[kube-monkey-tool directory](kube-monkey-tool).