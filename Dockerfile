FROM alpine:3.8 as builder
RUN apk update && apk --update upgrade openssl && apk add --no-cache git ca-certificates build-base libzen curl-dev && update-ca-certificates
RUN wget https://mediaarea.net/download/binary/mediainfo/24.04/MediaInfo_CLI_24.04_GNU_FromSource.tar.xz && tar -xvf MediaInfo_CLI_24.04_GNU_FromSource.tar.xz && cd MediaInfo_CLI_GNU_FromSource && ./CLI_Compile.sh --with-libcurl

ENV USER=appuser
ENV UID=10001

RUN adduser \    
    --disabled-password \    
    --gecos "" \    
    --home "/" \    
    --shell "/sbin/nologin" \    
    --no-create-home \    
    --uid "${UID}" \    
    "${USER}"


FROM scratch
LABEL maintainer="Vidsy <tech@vidsy.co>"

ARG VERSION
LABEL version=$VERSION

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
COPY --from=builder /MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI/mediainfo /usr/local/bin/mediainfo
USER appuser:appuser
