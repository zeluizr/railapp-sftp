#!/bin/bash

# Lê o arquivo de configuração e cria os usuários
while IFS=: read -r username password uid gid directory; do
  echo "Criando usuário: $username"
  useradd -m -u "$uid" -g "$gid" -d "$directory" "$username"
  echo "$username:$password" | chpasswd
  mkdir -p "$directory"
  chown "$username:$username" "$directory"
  chmod 755 "$directory"
done < /etc/sftp/users.conf

# Inicia o processo SFTP do contêiner original
exec /entrypoint "$@"
