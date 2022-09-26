#Nginx 웹 서버를 foreground로 실행
#Nginx를 foreground로 실행하지 않으면 docker run -d로 컨테이너를 생성해도 바로 정지된다
nginx -g "daemon off;"