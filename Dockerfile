FROM alpine:3.7
LABEL maintainer="Vidsy <tech@vidsy.co>"

RUN apk --update upgrade openssl && \
    apk add ca-certificates      && \
    update-ca-certificates       && \
    rm -rf /var/cache/apk/*      && \
    mkdir /app
