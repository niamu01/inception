FROM 	alpine:3.16.0

RUN 	apk update && apk upgrade

#-------nginx-------
RUN		apk add nginx
RUN		mkdir -p /var/www/html/
COPY	conf/default.conf /etc/nginx/http.d/default.conf

#-------openssl-------
RUN		apk add openssl
RUN		mkdir -p /etc/nginx/ssl

# Create SSl certificate
RUN		openssl req \
		-newkey rsa:4096 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42/OU=yeju/CN=localhost" \
		-keyout /etc/nginx/ssl/inception.key \
		-out /etc/nginx/ssl/inception.cert

#-------openrc-------
RUN		apk add openrc
RUN		rc-update add nginx default

#-------shell-------
COPY tools/run.sh /tmp/nginx_run.sh
RUN chmod +x ./tmp/nginx_run.sh
ENTRYPOINT [ "sh", "/tmp/nginx_run.sh" ]

EXPOSE	443
