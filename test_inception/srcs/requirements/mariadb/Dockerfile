FROM	alpine:3.14

RUN     apk update && apk upgrade

#-------openrc-------
RUN		apk add openrc

#-------mariadb-------
RUN		apk add mariadb
RUN		apk add mariadb-common
RUN		apk add mariadb-client
RUN		apk add mariadb-server-utils

COPY	conf/default.conf /etc/mysql/my.cnf
COPY	conf/default.conf /etc/my.cnf
COPY	conf/default.conf ~/my.cnf

RUN		mkdir -p /run/mysqld
RUN		mkdir -p /var/lib/mysql

RUN		chown -R mysql /var/lib/mysql
RUN		chmod 777 /var/lib/mysql

#-------shell-------
COPY    ./tools/run.sh /tmp/mariadb_run.sh
RUN     chmod +x /tmp/mariadb_run.sh
ENTRYPOINT [ "sh", "/tmp/mariadb_run.sh" ]

EXPOSE	3306

