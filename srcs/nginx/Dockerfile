FROM alpine

RUN apk add --update nginx && \
	mkdir /run/nginx && \
	touch /run/nginx/nginx.pid && \
	rm -rf /etc/nginx/conf.d/default.conf

COPY script.sh/ /etc/
COPY matrus_services.crt /etc/ssl/certs/matrus_services.crt
COPY matrus_services.key /etc/ssl/certs/matrus_services.key
COPY index.html /var/www/default/
COPY nginx.conf /etc/nginx/

EXPOSE 80
EXPOSE 443

CMD sh ./etc/script.sh
