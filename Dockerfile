FROM coredns/coredns:latest

COPY CoreFile /etc/coredns/CoreFile

# chmod +x не нужен, т.к. исполняемый файл уже есть

ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/CoreFile"]