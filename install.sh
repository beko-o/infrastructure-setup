#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Использование: $0 <домен>"
  echo "Пример: $0 example.kz"
  exit 1
fi

DOMAIN=$1

# Делаем скрипты исполняемыми
chmod +x configure.sh setup.sh

# Генерируем конфиги и .env
./configure.sh "$DOMAIN"

# Устанавливаем Docker/Docker Compose и запускаем контейнеры
./setup.sh
