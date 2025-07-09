#!/usr/bin/env bash
set -euo pipefail

echo "Загружаем переменные окружения..."
export $(grep -v '^#' .env | xargs)

echo "Добавляем репозитории Helm..."
helm repo add caddy https://caddyserver.github.io/helm
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add n8n https://n8nio.github.io/helm-charts
helm repo add supabase https://supabase.github.io/helm-charts
helm repo add zabbix-community https://zabbix-community.github.io/helm-zabbix
helm repo update

echo "Деплоим все сервисы через Helmfile..."
helmfile sync

echo "Готово! Проверить статусы: kubectl get pods -A"
