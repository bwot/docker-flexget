FROM python:3.5-alpine

RUN set -x \
    && pip install --upgrade pip \
    && pip install setuptools \
    && pip install flexget \
    && addgroup -S flexget && adduser -S -G flexget flexget \
    && mkdir /flexget \
    && chown flexget:flexget /flexget \
    && chmod 775 /flexget

USER flexget:flexget

ENV LOGLEVEL info

CMD flexget --loglevel $LOGLEVEL -c /flexget/config.yml daemon start
