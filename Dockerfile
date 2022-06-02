FROM centos:7

# Install Apache
RUN yum -y clean all
RUN yum -y update
RUN yum -y install httpd httpd-tools

RUN yum -y clean all


RUN mkdir /web/

COPY 92five-master /web/
COPY 92five.conf /etc/httpd/conf.d/

RUN chown -Rf apache:apache /web/
RUN chmod -R 0760 /web/

# Install EPEL Repo
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN     yum --setopt=tsflags=nodocs -y install \
        php56w \
        php56w-mcrypt\
        php56w-cli \
        php56w-mysql \
        php56w-pdo \
        php56w-mbstring \
        php56w-soap \
        php56w-gd \
        php56w-xml \
        php56w-pecl-apcu \
        php56w-pear \
        php56w-pecl-xdebug \
        php56w-process \
        && rm -rf /var/cache/yum/* \
        && yum clean all
# Composer Install
RUN yum install -y wget

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

RUN HASH="$(wget -q -O - https://composer.github.io/installer.sig)"

RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

COPY --from=composer:2.2 /usr/bin/composer /usr/local/bin/composer

WORKDIR /web

RUN composer update --no-scripts --ignore-platform-req=ext-dom
RUN composer install --no-scripts --ignore-platform-req=ext-dom

EXPOSE 80 3306 
# Start Apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]/
