# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: matrus <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/22 11:37:46 by matrus            #+#    #+#              #
#    Updated: 2020/09/22 17:00:53 by matrus           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk add --update nginx && \
	mkdir /run/nginx && \
	touch /run/nginx/nginx.pid && \
	rm -rf /etc/nginx/conf.d/default.conf
RUN apk add --update supervisor && \
	rm -rf /etc/supervisord.conf
RUN apk add --update openssh-server && \
	echo "root:pass1234" | chpasswd

#COPY script.sh/ /etc/
COPY matrus_services.crt /etc/ssl/certs/matrus_services.crt
COPY matrus_services.key /etc/ssl/certs/matrus_services.key
COPY index.html /var/www/default/
COPY nginx.conf /etc/nginx/

COPY supervisord.conf /etc/supervisord.conf

COPY ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa_key.pub
COPY ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
COPY sshd_config /etc/ssh/

EXPOSE 80
EXPOSE 443
EXPOSE 22

CMD ["/usr/bin/supervisord"]
