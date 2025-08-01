FROM alpine:3.20

RUN apk add --no-cache curl tar

ENV VERSION=1.12.2
ENV ARCH=amd64

# Скачиваем и распаковываем бинарник
RUN curl -L https://github.com/coredns/coredns/releases/download/v${VERSION}/coredns_${VERSION}_linux_${ARCH}.tgz \
    | tar -xz -C /usr/local/bin

COPY CoreFile /etc/coredns/Corefile

WORKDIR /etc/coredns
CMD ["/usr/local/bin/coredns", "-conf", "/etc/coredns/Corefile"]