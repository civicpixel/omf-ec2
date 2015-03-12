#!/bin/bash -xe
sed -i 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf
sed -i 's/StartServers       8/StartServers       5/g' /etc/httpd/conf/httpd.conf
sed -i 's/MinSpareServers    5/MinSpareServers    2/g' /etc/httpd/conf/httpd.conf
sed -i 's/MaxSpareServers   20/MaxSpareServers    5/g' /etc/httpd/conf/httpd.conf
sed -i 's/ServerLimit      256/ServerLimit        5/g' /etc/httpd/conf/httpd.conf
sed -i 's/MaxClients       256/MaxClients         5/g' /etc/httpd/conf/httpd.conf
yum --enablerepo=epel -y install phpmyadmin
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
sed -i 's/127.0.0.1/129.19.150.253/g' /etc/httpd/conf.d/phpMyAdmin.conf
/etc/init.d/httpd restart
