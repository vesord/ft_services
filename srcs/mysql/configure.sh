#!bin/sh

openrc default
/etc/init.d/mariadb setup

rc-service mariadb start
mysql < etc/wpdb_create.sql
rc-service mariadb stop

/usr/bin/mysqld_safe
