FROM	alpine:3.14

RUN 	apk update && apk upgrade

#-------nginx-------
RUN		apk add nginx
RUN		mkdir -p /var/www/html/
COPY	conf/default.conf /etc/nginx/http.d/default.conf

#-------openssl-------
RUN		apk add openssl
RUN		mkdir -p /etc/nginx/ssl

# Create SSl certificate
# https://www.openssl.org/docs/man1.0.2/man1/openssl-req.html
# openssl req : 인증서 요청을 만들고 처리합니다
#	예를 들어 root CA(certificate authority) 로 사용하기 위해 자체 서명된 인증서를 추가로 생성할 수 있습니다
#	- newkey: 새 인증서 요청과 새 개인 키를 만듭니다, 숫자는 비트길이
#	- x509: 인증서 요청 대신 자체 서명된 인증서를 출력
#	- sha256: 다이제스트 알고리즘
#	- days: 유효기간 (default:30days)
#	- nodes: 개인 키가 생성되더라도 암호화되지 않습니다
#	- subj: arg로 들어오는 데이터로 필드 수정
#		-C 국가코드
#		-ST 시/도
#		-L 구/군
#		-O 회사명
#		-OU 담당부서
#	- keyout: 개인 키를 쓸 기본 파일 이름
#	- out: 출력 파일 이름
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
