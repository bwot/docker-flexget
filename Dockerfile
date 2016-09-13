FROM alpine:3.4
MAINTAINER towb <me@towb.xyz>

RUN set -x \
    && apk add --no-cache \
    ca-certificates \
    py-pip \
    && pip install --upgrade pip \
    && pip install setuptools \
    && pip install flexget \
    && pip uninstall -y pip \
    && apk del py-pip \
    && mkdir /flexget

CMD ["flexget", "--loglevel", "verbose", "-c", "/flexget/config.yml", "daemon", "start"]
