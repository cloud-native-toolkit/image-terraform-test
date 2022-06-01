FROM alpine:3.16.0

ARG TARGETPLATFORM
ENV TERRAFORM_VERSION 1.2.1
ENV TERRAGRUNT_VERSION 0.36.10
ENV YQ_VERSION 4.16.2

RUN apk add --no-cache \
  git \
  curl \
  bash \
  gcompat \
  jq \
  && rm -rf /var/cache/apk/*

RUN curl -Lso /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_$(if [[ "$TARGETPLATFORM" == "linux/arm64" ]]; then echo "arm64"; else echo "amd64"; fi).zip && \
    mkdir -p /tmp/terraform && \
    cd /tmp/terraform && \
    unzip /tmp/terraform.zip && \
    mv ./terraform /usr/local/bin && \
    cd - && \
    rm -rf /tmp/terraform && \
    rm /tmp/terraform.zip

RUN curl -Lso /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_$(if [[ "$TARGETPLATFORM" == "linux/arm64" ]]; then echo "arm64"; else echo "amd64"; fi)" && chmod +x /usr/local/bin/yq

RUN wget -q -O ./terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_$(if [[ "$TARGETPLATFORM" == "linux/arm64" ]]; then echo "arm64"; else echo "amd64"; fi) && \
    chmod +x ./terragrunt && \
    mv ./terragrunt /usr/bin/terragrunt

ENTRYPOINT ["/bin/bash"]
