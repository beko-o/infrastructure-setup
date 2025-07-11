#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Использование: $0 <домен>"
  exit 1
fi

DOMAIN=$1

# .env
sed "s/{{DOMAIN}}/$DOMAIN/g" templates/.env.template > .env

# docker-compose.yml
sed "s/{{DOMAIN}}/$DOMAIN/g" templates/docker-compose.yml.template > docker-compose.yml

# Caddyfile
sed "s/{{DOMAIN}}/$DOMAIN/g" templates/Caddyfile.template > Caddyfile

echo "✅ Сгенерированы .env, docker-compose.yml и Caddyfile для $DOMAIN"
