FROM alpine:3.4
MAINTAINER towb <me@towb.xyz>

RUN set -x \
    && apk add --no-cache \
    ca-certificates \
    py-pip \
    && pip install --upgrade pip \
    && pip install setuptools \
    && pip install flexget \
    && mkdir /flexget

CMD ["flexget", "--loglevel", "verbose", "-c", "/flexget/config.yml", "--config-autoreload", "daemon", "start"]
