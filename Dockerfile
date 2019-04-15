FROM python:3.5-alpine

RUN set -x \
    && pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install flexget \
    && mkdir /flexget
ENV LOGLEVEL info
CMD flexget --loglevel $LOGLEVEL -c /flexget/config.yml daemon start
