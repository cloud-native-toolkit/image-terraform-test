FROM docker.io/hashicorp/terraform:1.1.9

RUN apk add --update-cache \
  curl \
  bash \
  gcompat \
  && rm -rf /var/cache/apk/*

RUN curl -Lso /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/v4.16.2/yq_linux_amd64" && chmod +x /usr/local/bin/yq

RUN wget -q -O ./terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.10/terragrunt_linux_amd64 && \
    chmod +x ./terragrunt && \
    mv ./terragrunt /usr/bin/terragrunt

ENTRYPOINT ["/bin/bash"]
