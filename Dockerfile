FROM docker.io/hashicorp/terraform:0.15.5

RUN apk add --update-cache \
  curl \
  bash \
  && rm -rf /var/cache/apk/*

