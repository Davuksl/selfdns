FROM coredns/coredns:latest

COPY Corefile /etc/coredns/Corefile

# chmod +x не нужен, т.к. исполняемый файл уже есть

ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/Corefile"]