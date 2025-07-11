#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Использование: $0 <домен>"
  echo "Пример: $0 example.kz"
  exit 1
fi

DOMAIN=$1

# даём права
chmod +x configure.sh setup.sh

# генерируем конфиги + env
./configure.sh "$DOMAIN"

# ставим Docker/Docker Compose и запускаем
./setup.sh
