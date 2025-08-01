FROM alpine:3.20

# Устанавливаем CoreDNS
RUN apk add --no-cache curl && \
    curl -L -o /coredns https://github.com/coredns/coredns/releases/latest/download/coredns_amd64 && \
    chmod +x /coredns

COPY CoreFile /etc/coredns/Corefile

ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/Corefile"]