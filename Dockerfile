FROM alpine:3.4
MAINTAINER charlie@vidsy.co

RUN apk --update upgrade    && \
    apk add ca-certificates && \
    update-ca-certificates  && \
    rm -rf /var/cache/apk/* && \
    mkdir /app
