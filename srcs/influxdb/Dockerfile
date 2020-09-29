FROM alpine:latest

LABEL maintainer=matrus

RUN apk add influxdb supervisor && \
	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
	mkdir -p /etc/telegraf && \
	sh -c "/usr/bin/telegraf -sample-config --input-filter docker \
						--output-filter influxdb > /etc/telegraf/telegraf.conf"

VOLUME ["/var/lib/influxdb"]

COPY supervisord.conf /etc/ 

EXPOSE 8086

CMD ["/usr/bin/supervisord"]
