#!/bin/sh

# tail -f /dev/null
if ! [ -f "/var/www/html/wp-config.php" ]; then
	mv /root/html/* /var/www/html/
    wp config create --path='/var/www/html' --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --dbprefix='wp_' --allow-root
	wp core install  --path='/var/www/html' --url='https://ereali.42.fr' --title='Blog Title' --admin_user=${MYSQL_USER} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email='ereali@student.42.fr' --allow-root
    # wp config create --path='/var/www/html' --dbname='db_name' --dbuser='user_name' --dbpass='user_pass' --dbhost='mysql' --dbprefix='wp_' --allow-root
	# wp core install  --path='/var/www/html' --url='http://ereali.42.fr' --title='Blog Title' --admin_user='adminuser' --admin_password='password' --admin_email='ereali@student.42.fr' --allow-root
	touch /var/log/access.log
	touch /var/log/error.log
fi

exec php-fpm7.3 -FR


# environment:
  # WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
  # MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
  # WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
  # WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
  # WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
  # WORDPRESS_TABLE_PREFIX=${WORDPRESS_TABLE_PREFIX}
# environment:
#   MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
#   MYSQL_DATABASE=${MYSQL_DATABASE}
#   MYSQL_USER=${MYSQL_USER}
#   MYSQL_PASSWORD=${MYSQL_PASSWORD}