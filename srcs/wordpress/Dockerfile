FROM alpine:latest

LABEL maintainer=matrus

RUN apk add --update nginx php7 php7-fpm php7-mysqli php7-json supervisor && \
	rm -rf /etc/supervisord.conf && \
	rm -rf /etc/nginx/conf.d/default.conf && \
	mkdir /run/nginx && \
	touch /run/nginx/nginx.pid

ADD wordpress-5.5.1-ru_RU.tar.gz /var/www/

COPY wp-config.php /var/www/wordpress/
COPY supervisord.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/

RUN chmod 777 -R /var/www/

EXPOSE 5050

CMD ["/usr/bin/supervisord"]

#FROM alpine:latest

#LABEL maintainer=matrus

#RUN apk add --update nginx \
#	php7 php7-fpm php7-mysqli php7-curl php7-gd php7-zlib php7-json \
#	supervisor && \
#	rm -rf /etc/supervisord.conf && \
#	rm -rf /etc/nginx/conf.d/default.conf && \
#	mkdir /run/nginx && \
#	touch /run/nginx/nginx.pid

#ADD wordpress-5.5.1-ru_RU.tar.gz /var/www/

#COPY wp-config.php /var/www/wordpress/
#COPY supervisord.conf /etc/
#COPY nginx.conf /etc/nginx/


#EXPOSE 5050

#CMD ["/usr/bin/supervisord"]

