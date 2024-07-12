FROM alpine:3 as builder
RUN apk update && apk --update upgrade openssl && apk add --no-cache git ca-certificates && update-ca-certificates

FROM alpine:3
LABEL maintainer="Vidsy <tech@vidsy.co>"

ARG VERSION
LABEL version=$VERSION

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

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
USER appuser:appuser
