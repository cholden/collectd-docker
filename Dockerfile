FROM ubuntu
#FROM debian:jessie

#RUN groupadd -g 1000 docker
#RUN useradd -g docker docker
 
RUN apt-get -y update && apt-get -y install libcurl3-gnutls 

COPY . /go/src/github.com/bobrik/collectd-docker

ENV COLLECTD_HOST InventoryApp-AS1
ENV COLLECTD_INTERVAL 1
RUN /go/src/github.com/bobrik/collectd-docker/docker/build.sh

ENTRYPOINT ["/run.sh"]
