#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Запуск установки..."

# Устанавливаем Docker, если нужно
if ! command -v docker &> /dev/null; then
  echo "Устанавливаем Docker..."
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  rm get-docker.sh
fi

# Устанавливаем Docker Compose (плагин), если нужно
if ! docker compose version &> /dev/null; then
  echo "Устанавливаем Docker Compose..."
  sudo apt update
  sudo apt install docker-compose-plugin -y
fi

echo "✅ Docker и Docker Compose готовы"

# Запускаем контейнеры
echo "🚀 Поднимаем сервисы..."
docker compose up -d

echo "🎉 Все сервисы запущены!"
