FROM ubuntu:16.04


#RUN export LANG=C.UTF-8

RUN apt-get update
RUN apt-get -y install software-properties-common
#RUN apt-add-repository -y ppa:ondrej/php

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update && apt-get install -y  unzip apache2 php5.6 php5.6-mysql php-pear

#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
#RUN echo "mysql-server mysql-server/root_password password abcd" | debconf-set-selections
#RUN echo "mysql-server mysql-server/root_password_again password abcd" | debconf-set-selections

WORKDIR /tmp

COPY ./DVWA-master.zip /tmp

RUN rm -rf /var/www/html &&  unzip /tmp/DVWA-master.zip -d /tmp/ && rm /tmp/DVWA-master.zip &&  mv /tmp/DVWA-master /var/www/html && chmod -R 777 /var/www/html  && echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY config.inc.php /var/www/html/config/

COPY php.ini /etc/php/5.6/apache2/php.ini 

EXPOSE 80

#RUN echo "/etc/init.d/apache2 start &" >> /tmp/apache2.sh && chmod +x /tmp/apache2.sh

#CMD ["/tmp/apache2.sh"]


CMD ["apache2ctl" , "-D" ,"FOREGROUND"]









