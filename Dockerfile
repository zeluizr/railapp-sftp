# Usando a imagem base atmoz/sftp
FROM atmoz/sftp

# Copia o arquivo de configuração de usuários
COPY users.conf /etc/sftp/users.conf

# Cria um script para configurar os usuários no contêiner
COPY setup-users.sh /usr/local/bin/setup-users.sh
RUN chmod +x /usr/local/bin/setup-users.sh

# Exponha a porta 22 para o SFTP
EXPOSE 22

# Executa o script para criar os usuários no startup
ENTRYPOINT ["/usr/local/bin/setup-users.sh"]
