FROM ubuntu:16.04

MAINTAINER Sanjeev

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf
    
VOLUME /var/run/docker.sock
    

EXPOSE 80
CMD ["nginx"]
