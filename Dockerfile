FROM alpine
ARG VERSION=v0.7.0

ADD https://github.com/bitnami-labs/sealed-secrets/releases/download/$VERSION/kubeseal-linux-amd64 /usr/bin/kubeseal
COPY ./entrypoint.sh /usr/bin/entrypoint.sh

RUN apk add --no-cache bash && chmod a+x /usr/bin/*

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]