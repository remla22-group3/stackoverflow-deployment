# REMLA22 Group3 Deployment

## Prerequisite Software
- `docker`
- `kubectl`*
- `helm`*

## Getting Started

We provide both a **Docker Compose** and a **Kubernetes** config. The **Docker Compose** version does NOT provide access to monitoring and analytics.

### Docker Compose
To get up and running: `docker-compose up -d`. To shut everything down: `docker-compose down`.

### Kubernetes
To get up and running run the shell script `init.sh`.

Similarly, to get rid of the setup run the shell script `remove.sh`.

To access **Prometheus**' interface: `kubectl port-forward prometheus-promstack-kube-prometheus-prometheus-0 9090`.

It will then be available at http://localhost:9090/.

To access **Grafana**'s interface: `kubectl port-forward $(kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep ^promstack-grafana-) 3000`.

It will then be available at http://localhost:3000/.

The default credentials are `admin` and `prom-operator`.

An export of the group's dashboard has been provided through the file `graphana_dashboard.json`. Follow the instructions from the [Grafana documentation page](https://grafana.com/docs/grafana/latest/dashboards/export-import/) for instructions on importing it.

#### The web application is accessible through `my-ingress`.

***Note***: If you are running Kubernetes locally through `minikube`, you will first need to enable the Ingress controller by executing: `minikube addons enable ingress`. Furthermore, if you are also using the `docker` driver, you will need to run `minikube tunnel` to have it accessible at http://localhost/.
