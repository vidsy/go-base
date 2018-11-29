FROM alpine:3.8
LABEL maintainer="Vidsy <tech@vidsy.co>"

ARG VERSION
LABEL version=$VERSION

RUN apk --update upgrade openssl && \
    apk add ca-certificates      && \
    update-ca-certificates       && \
    rm -rf /var/cache/apk/*      && \
    mkdir /app
