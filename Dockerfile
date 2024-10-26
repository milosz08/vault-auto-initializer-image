FROM hashicorp/vault:latest

RUN apk add --no-cache bash
SHELL ["/bin/bash", "-c"]

COPY config/init-vault init-vault
COPY config/vault.hcl /vault/config/vault.hcl

RUN chmod +x init-vault

LABEL maintainer="milosz08" \
  description="Vault with auto-initializer for development purposes." \
  readme="https://github.com/milosz08/vault-auto-initializer-image/blob/master/README.md"

ENTRYPOINT ["/init-vault"]