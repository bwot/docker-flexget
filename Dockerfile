FROM alpine:3.5
MAINTAINER towb <me@towb.xyz>

RUN set -x \
    && apk add --no-cache \
    ca-certificates \
    py2-pip \
    && pip install --upgrade pip \
    && pip install setuptools \
    && pip install flexget \
    && mkdir /flexget

CMD ["flexget", "--loglevel", "verbose", "-c", "/flexget/config.yml", "daemon", "start"]
