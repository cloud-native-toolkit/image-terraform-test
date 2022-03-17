FROM docker.io/hashicorp/terraform:1.0.11

RUN apk add --update-cache \
  curl \
  bash \
  gcompat \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/bash"]
