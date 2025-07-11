#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Установка..."

# Docker
if ! command -v docker &> /dev/null; then
  echo "  • Устанавливаем Docker..."
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  rm get-docker.sh
fi

# Docker Compose plugin
if ! docker compose version &> /dev/null; then
  echo "  • Устанавливаем Docker Compose..."
  sudo apt update
  sudo apt install -y docker-compose-plugin
fi

echo "✅ Docker и Compose готовы"
echo "🚀 Поднимаем контейнеры..."
docker compose up -d
echo "🎉 Готово!"
