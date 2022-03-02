FROM docker.io/hashicorp/terraform:1.1.6

RUN apk add --update-cache \
  curl \
  bash \
  && rm -rf /var/cache/apk/*

