# ft_services
## Description

It's a setup configuration for Kubernetes cluster including different web-services.

It was made due to my studying in 21-school, Russia.
The main goal of project - learn how to organize and setup cluster in Kubernetes with Docker.

## Requirments

You need to install [minikube](https://minikube.sigs.k8s.io/docs/start/) and
[virtualbox](https://minikube.sigs.k8s.io/docs/drivers/ "checkout for virtualbox driver") minikube driver. Than launch the 

`./setup.sh` 

and wait untill cluster sets up.

After setting up checkout for `minikube dashboard` and enjoy this little cute cluster.

## Info

Cluster contains the following services:

### Nginx server
A Nginx server listening on ports 80 and 443. Port 80 has a systematic redirection of type 301 to 443, which https. 
The page displayed is just my sample page (learning project you know:D ).

Also you can access Nginx service via SSH.

### FTPS server
A FTPS server listening port 21.

### MySQL database
Database for keeping tables of Wordpress and PhpMyAdmin (see bellow) 

### WordPress
A WordPress website listening on port 5050, which is working with a MySQL database.
The WordPress website has several users and an administrator.

### PhpMyAdmin
A PhpMyAdmin linked with MySQL

### InfluxDB and Telegraf
Database and it's service to monitore all the containers in the cluster.

### Grafana
Grafana platform, listening on port 3000, linked with an InfluxDB database.
Grafana is monitoring all the containers. There'are one dashboard per service.

## Issues

In case of crush of `setup.sh` just relaunch it. Bad stuff happens.

## Some screenshots for those who dont have an idea what is this

