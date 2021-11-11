FROM ubuntu:14.04
MAINTAINER Brad Parker <brad@parker1723.com>
RUN apt-get update
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server apache2 libapache2-mod-php5 pwgen python-setuptools python3-pip vim-tiny php5-mysql  php5-ldap unzip

# setup ShoppingStreet
RUN pip3 install supervisor
ADD ./scripts/start.sh /start.sh
ADD ./scripts/passwordHash.php /passwordHash.php
ADD ./scripts/foreground.sh /etc/apache2/foreground.sh
ADD ./configs/supervisord.conf /etc/supervisord.conf
ADD ./configs/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN rm -rf /var/www/
ADD https://github.com/S71NGR4Y/Vibranium/archive/master.zip /Vibranium-master.zip
RUN unzip /Vibranium-master.zip -d ShoppingStreet
RUN mkdir /var/www/
RUN mv /ShoppingStreet/Vibranium-master/ /var/www/ShoppingStreet
RUN cp /var/www/ShoppingStreet/assets/config/db.sample.php /var/www/ShoppingStreet/assets/config/db.php
RUN cp /var/www/ShoppingStreet/assets/config/email.sample.php /var/www/ShoppingStreet/assets/config/email.php
ADD ./configs/parameters.php /var/www/ShoppingStreet/assets/config/parameters.php
ADD ./configs/rest.php /var/www/ShoppingStreet/assets/config/rest.php
ADD ./configs/createdb.sql /var/www/ShoppingStreet/database/createdb.sql
RUN chown -R www-data:www-data /var/www/
RUN chown -R www-data:www-data /var/www/ShoppingStreet/web/products_pictures/
RUN chown -R www-data:www-data /var/www/ShoppingStreet/web/upload
RUN chown -R www-data:www-data /var/www/ShoppingStreet/assets/config
RUN chmod 755 /start.sh
RUN chmod 755 /etc/apache2/foreground.sh
RUN a2enmod rewrite 
RUN mkdir /var/log/supervisor/

EXPOSE 80
CMD ["/bin/bash", "/start.sh"]
