FROM alpine:3.4
MAINTAINER towb <me@towb.xyz>

RUN apk add --update ca-certificates py-pip \
    && pip install --upgrade pip \
    && pip install setuptools \
    && pip install flexget \
    && mkdir /flexget && rm -rf /var/cache/apk/*

CMD ["flexget", "--loglevel", "verbose", "-c", "/flexget/config.yml", "daemon", "start"]
