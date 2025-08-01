FROM coredns/coredns:latest

COPY Corefile /etc/coredns/CoreFile

# chmod +x не нужен, т.к. исполняемый файл уже есть

ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/CoreFile"]