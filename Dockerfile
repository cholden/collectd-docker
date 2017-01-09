FROM debian:jessie

RUN apt-get -y update && apt-get -y install libcurl3-gnutls 

COPY . /go/src/github.com/bobrik/collectd-docker

ENV COLLECTD_HOST chips-desktop
ENV COLLECTD_INTERVAL 1
RUN /go/src/github.com/bobrik/collectd-docker/docker/build.sh

ENTRYPOINT ["/run.sh"]
