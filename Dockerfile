FROM alpine:3.14

ENV SHELLCHECK_VERSION=0.7.1
ENV SHELLCHECK_VERSION_TAG v$SHELLCHECK_VERSION

RUN apk add --no-cache bash
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN wget https://github.com/koalaman/shellcheck/releases/download/${SHELLCHECK_VERSION_TAG}/shellcheck-${SHELLCHECK_VERSION_TAG}.linux.x86_64.tar.xz -O- | \
    tar xJvf - shellcheck-${SHELLCHECK_VERSION_TAG}/shellcheck && \
    mv shellcheck-${SHELLCHECK_VERSION_TAG}/shellcheck /bin && \
    rmdir shellcheck-${SHELLCHECK_VERSION_TAG}/ && \
    shellcheck -V
