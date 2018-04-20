# Create a basic httpd container
FROM centos:6.9

MAINTAINER Paul Lupu  

ADD assets/mysql.repo /etc/yum.repos.d

RUN yum install -y httpd php php-mysql && yum clean all && mkdir -p /var/www/html/images && chown apache /var/www/html/images

ADD assets/codecamp.png /var/www/html/images/codecamp.png

ADD assets/index.php /var/www/html/index.php



EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
