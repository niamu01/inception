FROM    alpine:3.16.0

RUN     apk update && apk upgrade

#-------php-fpm-------
RUN     apk add php8-fpm php8-mysqli php8-phar php8-mbstring php8-gd php8-session

RUN		apk add curl wget openrc

# RUN		rm -f /etc/php8/php-fpm.d/www.conf
COPY	conf/default.conf /etc/php8/php-fpm.d/www.conf

#-------wordpress-------
RUN		mkdir -p /var/www/html
RUN		adduser -u 82 -D -S -G www-data www-data
RUN		chmod 777 -R /var/www/html
RUN		chown -R www-data:www-data /var/www/html

COPY	./conf/wp-config.php ./

#-------shell-------
COPY    ./tools/run.sh /tmp/wordpress_run.sh
RUN     chmod +x /tmp/wordpress_run.sh
ENTRYPOINT [ "sh", "/tmp/wordpress_run.sh" ]

EXPOSE	9000
