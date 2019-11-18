FROM devopsedu/webapp
MAINTAINER Mulalo Mphidi <mphidi@gmail.com>
#Update Repository
RUN apt-get update -y
#Copy Application Files
RUN rm -rf /var/www/html/*
ADD projcert/website /var/www/html
#Configure Apache (Optional)
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
#Open port 80
EXPOSE 80
#Start Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
