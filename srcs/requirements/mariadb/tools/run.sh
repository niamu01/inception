mkdir -p /home/yeju/data/database
mkdir -p /home/yeju/data/www

# https://mariadb.com/kb/en/mysql_install_db/
/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
# 서비스 구동
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql & sleep 2

# wordpress 데이터베이스 생성
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
# 계정 생성
mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# 데이터베이스 권한 부여
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# root에 비밀번호 생성
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
# 새로고침
mysql -e "FLUSH PRIVILEGES;"

# mysql 서버 종료
# pkill mysqld
mysqladmin -uroot -p${MARIADB_ROOT_PASSWORD} shutdown

# 재실행
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql
