FROM hashicorp/vault:latest

RUN apk update
RUN apk add --no-cache bash
RUN apk add --no-cache jq

SHELL ["/bin/bash", "-c"]

COPY config/init-vault init-vault
COPY config/vault.hcl /vault/config/vault.hcl

RUN chmod +x init-vault

LABEL maintainer="milosz08" \
  description="Vault with auto-initializer for development purposes."

ENTRYPOINT ["/init-vault"]