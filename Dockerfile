FROM python:3.5-alpine

# hadolint ignore=DL3013
RUN set -x \
    && addgroup -S flexget && adduser -SD -s /bin/sh -G flexget flexget \
    && pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install flexget \
    && mkdir /flexget \
    && chown flexget:flexget /flexget

USER flexget

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
