FROM coredns/coredns:latest

# Копируем Corefile конфиг
COPY CoreFile /etc/coredns/Corefile

# Убедимся, что /coredns исполняемый
RUN chmod +x /coredns

# Указываем точку входа и команду запуска
ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/Corefile"]