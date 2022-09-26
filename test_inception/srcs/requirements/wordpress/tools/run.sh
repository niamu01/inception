#sleep for mysql starting
sleep 5

#download wp-cli (wordpress command line interface)
curl				-O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod				+x wp-cli.phar
mv					-f wp-cli.phar /usr/local/bin/wp

/usr/local/bin/wp	core download --allow-root --path="/var/www/html"

# move config file
mv					./wp-config.php /var/www/html/wp-config.php

# WordPress install
# https://developer.wordpress.org/cli/commands/core/install/
#   - url : the address of the new site
#   - title : the title of the new site
#   - admin_user : the name of the admin user
#   - admin_password : the password for the admin user (default to randomly generated string)
#   - admin_email : the email address for the admin user
#   - skip-email : don't send an email notification to the new admin user
#   - path : path to the wordpress files
/usr/local/bin/wp	core install \
					--allow-root \
					--path="/var/www/html" \
					--url=${WORDPRESS_HOST} \
					--title=${WORDPRESS_TITLE} \
					--admin_user=${WORDPRESS_ADMIN_USER} \
					--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
					--admin_email=${WORDPRESS_ADMIN_EMAIL} \
					--skip-email

# WordPress User Create
# https://developer.wordpress.org/cli/commands/user/create/
# usage: wp user create <user> <user-email> --option
#   - role : The role of the user to create. (Default: default role)
#            values can be ‘administrator’, ‘editor’, ‘author’, ‘contributor’, ‘subscriber’
#   - user_pass : The user password. (Default: randomly generated)
/usr/local/bin/wp	user create \
					--allow-root \
					--path="/var/www/html" \
					${WORDPRESS_USER} \
					${WORDPRESS_EMAIL} \
					--role=author \
					--user_pass=${WORDPRESS_PASSWORD}

# no subshell is created and the current process is replaced
exec	php-fpm7 -F
