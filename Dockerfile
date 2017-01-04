FROM alpine:3.5
MAINTAINER charlie@vidsy.co

RUN apk --update upgrade openssl && \
    apk add ca-certificates      && \
    update-ca-certificates       && \
    rm -rf /var/cache/apk/*      && \
    mkdir /app
