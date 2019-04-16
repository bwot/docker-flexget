FROM python:3.5-alpine

RUN set -x \
    && pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install flexget \
    && mkdir /flexget

CMD flexget -c /flexget/config.yml daemon start
