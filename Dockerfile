FROM docker.io/hashicorp/terraform:1.1.7

RUN apk add --update-cache \
  curl \
  bash \
  gcompat \
  && rm -rf /var/cache/apk/*

