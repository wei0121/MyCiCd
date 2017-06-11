FROM debian:jessie-backports

ADD . /var/certbot/xwrhome

RUN apt-get update \
  && apt-get install -y expect \
  && apt-get install -y certbot -t jessie-backports \
  && chmod +x /var/certbot/xwrhome/setup.sh \
  && /var/certbot/xwrhome/setup.sh
