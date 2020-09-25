# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: matrus <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/22 10:23:09 by matrus            #+#    #+#              #
#    Updated: 2020/09/25 11:49:56 by matrus           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/sh

minikube start --vm-driver=virtualbox
minikube addons enable metallb
kubectl apply -f srcs/metallb/metallb_config.yaml
eval $(minikube docker-env)
