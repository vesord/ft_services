FROM alpine:3.7

LABEL maintainer=matrus

RUN apk add mariadb mariadb-client\
	openrc

COPY my.cnf /etc/mysql/my.cnf
COPY wpdb_create.sql /etc/
COPY wordpress.sql /etc/
COPY configure.sh /etc/

VOLUME ["/sys/fs/cgroup"]
VOLUME ["/var/lib/mysql"]

#RUN openrc default && \
#	/etc/init.d/mariadb setup && \
#	rc-service mariadb start && \
#	mysql < etc/wpdb_create.sql && \
#	rc-service mariadb stop

EXPOSE 3306


CMD ./etc/configure.sh
