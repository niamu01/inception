FROM	alpine:3.14

RUN     apk update && apk upgrade

#-------php_fpm-------
RUN		apk add php7 php7-fpm php7-opcache php7-mysqli php7-session php7-iconv \
		php7-json php7-gd php7-curl php7-xml php7-common php7-imap php7-cgi \
		php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
		php7-redis php7-gettext php7-ldap php7-ctype php7-dom php7-phar php7-gd \
		php7-zlib

RUN		apk add curl wget openrc

COPY	conf/default.conf /etc/php7/php-fpm.d/www.conf

#-------wordpress-------
RUN		mkdir -p /var/www/html

#adduser
#	- u: --uid
#	- D: update default setting
#	- S: shell name
#	- G: --gid name of group
RUN		adduser -u 82 -D -S -G www-data www-data

#change mode
#	- R : directory and subfile
RUN		chmod 777 -R /var/www/html

#change owner[:group]
RUN		chown -R www-data:www-data /var/www/html

COPY	./conf/wp-config.php ./

#-------shell-------
COPY    ./tools/run.sh /tmp/wordpress_run.sh
RUN     chmod +x /tmp/wordpress_run.sh
ENTRYPOINT [ "sh", "/tmp/wordpress_run.sh" ]

EXPOSE	9000
