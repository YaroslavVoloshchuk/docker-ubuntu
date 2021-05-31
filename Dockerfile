FROM ubuntu:18.04

LABEL maintainer="bamiks@gmail.com"
LABEL description="Docker image based on Ubuntu with some software as ngnix, php, git etc"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&  apt-get upgrade -y \
&& apt -y install software-properties-common && add-apt-repository ppa:ondrej/php && apt-get update \
&&  apt-get install -y \
    busybox \
    nginx \
    php7.4 \
    php7.4-fpm \
    nano \
    wget \
    curl \
    git \
    htop \
    vim \
    supervisor \
    mysql-client \
    redis-tools \
    tzdata \
&&  apt-get clean \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN cp /usr/share/zoneinfo/Europe/Kiev /etc/localtime

CMD ["sh", "-c", "service php7.4-fpm start && nginx -g 'daemon off;'"] 

EXPOSE 80



