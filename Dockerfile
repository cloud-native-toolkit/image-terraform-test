FROM docker.io/alpine

RUN apk add --update-cache \
  curl \
  bash \
  && rm -rf /var/cache/apk/*

