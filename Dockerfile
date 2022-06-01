FROM docker.io/hashicorp/terraform:1.1.9

ARG TARGETPLATFORM

RUN apk add --update-cache \
  curl \
  bash \
  gcompat \
  jq \
  && rm -rf /var/cache/apk/*

RUN curl -Lso /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/v4.16.2/yq_linux_$(if [[ "$TARGETPLATFORM" == "linux/arm64" ]]; then echo "arm64"; else echo "amd64"; fi)" && chmod +x /usr/local/bin/yq

RUN wget -q -O ./terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.10/terragrunt_linux_$(if [[ "$TARGETPLATFORM" == "linux/arm64" ]]; then echo "arm64"; else echo "amd64"; fi) && \
    chmod +x ./terragrunt && \
    mv ./terragrunt /usr/bin/terragrunt

ENTRYPOINT ["/bin/bash"]
