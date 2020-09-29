FROM alpine:3.7

LABEL maintainer=matrus

RUN apk add mariadb mariadb-client\
	openrc

COPY my.cnf /etc/mysql/
COPY wpdb_create.sql /etc/
COPY wordpress.sql /etc/
COPY configure.sh /etc/

VOLUME ["/sys/fs/cgroup"]
VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ./etc/configure.sh
