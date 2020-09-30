# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: matrus <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/22 10:23:09 by matrus            #+#    #+#              #
#    Updated: 2020/09/30 07:39:43 by matrus           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/sh

echo "---STARTING MINIKUBE---"
minikube start --vm-driver=virtualbox					|| (echo "---FAILED---" ; exit 1)

echo "---ENABLING METALLB ADDON---"
minikube addons enable metallb							|| (echo "---FAILED---" ; exit 1)

echo "---APPLYING METALLB CONFIG---"
kubectl apply -f srcs/metallb/metallb_config.yaml		|| (echo "---FAILED---" ; exit 1)

echo "---CHANGING DOCKER ENVIRONMENT---"
eval $(minikube docker-env)								|| (echo "---FAILED---" ; exit 1)


#echo "---BUILDING NGINX CONTAINER---"
#docker build	-t nginx:matrus ./srcs/nginx/			|| (echo "---FAILED---" ; exit 1)

#echo "---APPLYING NGINX.YAML TO KUBERNETES---"
#kubectl apply	-f ./srcs/nginx/nginx.yaml				|| (echo "---FAILED---" ; exit 1)


echo "---BUILDING WORDPRESS CONTAINER---"
docker build -t wordpress:matrus ./srcs/wordpress		|| (echo "---FAILED---" ; exit 1)

echo "---APPLYING WORDPRESS.YAML TO KUBERNETES---"
kubectl apply -f ./srcs/wordpress/wordpress.yaml		|| (echo "---FAILED---" ; exit 1)


echo "---BUILDING MYSQL CONTAINER---"
docker build -t mysql:matrus ./srcs/mysql				|| (echo "---FAILED---" ; exit 1)

echo "---APPLYING MYSQL PERSISTENT VOLUME TO KUBERNETES---"
kubectl apply -f ./srcs/mysql/pv.yaml					|| (echo "---FAILED---" ; exit 1)

echo "---APPLYING MYSQ.YAML TO KUBERNETES---"
kubectl apply -f ./srcs/mysql/mysql.yaml				|| (echo "---FAILED---" ; exit 1)


#echo "---BUILDING PHPMYADMIN CONTAINER---"
#docker build -t phpmyadmin:matrus ./srcs/phpma			|| (echo "---FAILED---" ; exit 1)

#echo "---APPLYING PHPMYADMIN.YAML TO KUBERNETES---"
#kubectl apply -f ./srcs/phpma/phpmyadmin.yaml			|| (echo "---FAILED---" ; exit 1)


#echo "---BUILDING FTPS CONTAINER---"
#docker build -t ftps:matrus ./srcs/ftps					|| (echo "---FAILED---" ; exit 1)

#echo "---APPLYING FTPS.YAML TO KUBERNETES---"
#kubectl apply -f ./srcs/ftps/ftps.yaml					|| (echo "---FAILED---" ; exit 1)


#echo "---BUILDING INFLUXDB CONTAINER---"
#docker build -t influxdb:matrus ./srcs/influxdb			|| (echo "---FAILED---" ; exit 1)

#echo "---APPLYING INFLUXDB PERSISTENT VOLUME TO KUBERNETES---"
#kubectl apply -f ./srcs/influxdb/pv.yaml				|| (echo "---FAILED---" ; exit 1)

#echo "---APPLYING INFLUXDB.YAML TO KUBERNETES---"
#kubectl apply -f ./srcs/influxdb/influxdb.yaml			|| (echo "---FAILED---" ; exit 1)


#echo "---BUILDING GRAFANA CONTAINER---"
#docker build -t grafana:matrus ./srcs/grafana			|| (echo "---FAILED---" ; exit 1)

#echo "---APPLYING GRAFANA.YAML TO KUBERNETES---"
#kubectl apply -f ./srcs/grafana/grafana.yaml			|| (echo "---FAILED---" ; exit 1)
