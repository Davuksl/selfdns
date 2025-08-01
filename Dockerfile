FROM alpine:3.20

RUN apk add --no-cache curl

# Получаем архитектуру и качаем нужный бинарь
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
      ARCHSTR="amd64"; \
    elif [ "$ARCH" = "aarch64" ]; then \
      ARCHSTR="arm64"; \
    else \
      echo "Unsupported architecture: $ARCH"; exit 1; \
    fi && \
    curl -L -o /coredns "https://github.com/coredns/coredns/releases/latest/download/coredns_${ARCHSTR}" && \
    chmod +x /coredns

COPY CoreFile /etc/coredns/Corefile

ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/Corefile"]