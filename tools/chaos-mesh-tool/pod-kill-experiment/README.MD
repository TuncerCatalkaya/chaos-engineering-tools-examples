# Pod kill experiment for chaos-mesh
Every minute a random pod, from the ones that opted-in (customer-service and order-service),
is killed.

## How to run the experiment
Run the Kubernetes Cluster by following the steps from [chaos-mesh README](../README.MD).  
After these steps the Chaos Mesh Dashboard should be launched and displayed in
a browser.

In order to kill a pod every minute in chaos-mesh, it is required to add a new *schedule*.

### Go to Schedules
![](imgs/chaos_mesh_dashboard_schedules.PNG)

### Create new schedule
![](imgs/chaos_mesh_dashboard_schedules_new_schedule.PNG)

### Inject into Kubernetes, Pod Fault, Pod kill and submit
![](imgs/chaos_mesh_dashboard_schedules_inject_into.PNG)

### Fill the schedule info and submit
* Name: `pod-kill-customer-order-every-minute-schedule`
* Namespace Selectors: `default`
* Label Selectors: `runCustomOrder: custom-order`  
Extra Kubernetes Selector to select customer-service and order-service
* Mode: `Fixed Number`
* Mode value: `1`
* Schedule: `@every 1m`
![](imgs/chaos_mesh_dashboard_schedules_fill_schedule_info.PNG)

### Submit the configured schedule
![](imgs/chaos_mesh_dashboard_schedules_submit.PNG)

### The new schedule should be now displayed in the schedules tab
![](imgs/chaos_mesh_dashboard_schedules_created_schedule.PNG)
The schedule is creating every minute a new experiment in the Experiments tab
with the configured pod kill settings and the name of the created schedule
with a UUID attached to it.
![](imgs/chaos_mesh_dashboard_schedules_experiments.PNG)

## How to check the status of the experiment
There are multiple places where it is possible to check the status of the experiment.

### Inside the created schedule
Click on the created schedule.
![](imgs/chaos_mesh_dashboard_schedules_created_schedule_clickable_area.PNG)

The event information are displayed in the marked area.
![](imgs/chaos_mesh_dashboard_schedules_inside_schedule.PNG)

### At the dashboard
![](imgs/chaos_mesh_dashboard_schedules_dashboard.PNG)

### At the events
Click on the created schedule.
![](imgs/chaos_mesh_dashboard_schedules_events.PNG)

### Check pods in Kubernetes
The customer-service or order-service should be killed every minute.
```shell
kubectl get pods # get pods from default namespace
```