FROM coredns/coredns:latest
COPY CoreFile /etc/coredns/Corefile
EXPOSE 53/udp
EXPOSE 53/tcp
CMD ["/coredns", "-conf", "/etc/coredns/Corefile"]