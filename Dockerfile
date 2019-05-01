FROM python:3.5-alpine

# hadolint ignore=DL3013,DL3018
RUN set -x \
    && apk add --no-cache \
      su-exec \
      tzdata \
    && pip install --upgrade pip \
    && pip install --upgrade setuptools \
    && pip install flexget

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
