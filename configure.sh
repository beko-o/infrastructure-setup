#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Использование: $0 <домен>"
  exit 1
fi

DOMAIN=$1

# 1) Генерируем .env
sed "s/{{DOMAIN}}/$DOMAIN/g" templates/.env.template > .env

# 2) Генерируем docker-compose.yml
sed "s/{{DOMAIN}}/$DOMAIN/g" templates/docker-compose.yml.template > docker-compose.yml

# 3) Генерируем Caddyfile
sed "s/{{DOMAIN}}/$DOMAIN/g" templates/Caddyfile.template > Caddyfile

echo "✅ Сгенерированы .env, docker-compose.yml и Caddyfile для домена $DOMAIN"
