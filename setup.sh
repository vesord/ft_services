# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: matrus <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/22 10:23:09 by matrus            #+#    #+#              #
#    Updated: 2020/09/28 13:15:27 by matrus           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/sh

minikube start --vm-driver=virtualbox
minikube addons enable metallb
kubectl apply -f srcs/metallb/metallb_config.yaml
eval $(minikube docker-env)

#docker build -t wordpress:matrus ./srcs/wordpress
#kubectl apply -f ./srcs/wordpress/wordpress.yaml

#docker build -t mysql:matrus ./srcs/mysql
#kubectl apply -f ./srcs/mysql/pv.yaml
#kubectl apply -f ./srcs/mysql/mysql.yaml

#docker build -t phpmyadmin:matrus ./srcs/phpma
#kubectl apply -f ./srcs/phpma/phpmyadmin.yaml

docker build -t ftps:matrus ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps.yaml
