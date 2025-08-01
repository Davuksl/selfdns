FROM alpine:3.20

RUN apk add --no-cache curl tar busybox-extras

RUN curl -L https://github.com/coredns/coredns/releases/download/v1.12.2/coredns_1.12.2_linux_amd64.tgz \
    | tar -xz -C /usr/local/bin

# Копируем Corefile и зону
COPY Corefile /etc/coredns/Corefile
COPY zones /zones

# HTTP порт для Render
EXPOSE 53/udp
EXPOSE 53/tcp
EXPOSE 8080

WORKDIR /etc/coredns

CMD /usr/local/bin/coredns -conf /etc/coredns/Corefile & httpd -f -p 8080 && tail -f /dev/null