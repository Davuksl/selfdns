FROM coredns/coredns:latest

COPY CoreFile /etc/coredns/Corefile

CMD ["/coredns", "-conf", "/etc/coredns/Corefile"]