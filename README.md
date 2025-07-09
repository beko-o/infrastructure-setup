# Быстрая настройка Ubuntu-сервера под наши сервисы

## Предварительные требования

- Пустой Ubuntu 22.04 (или выше)
- Доступ по SSH
- DNS-записи для домена, указанные в `.env`

## Шаг 1. Клонирование репозитория

git clone https://github.com/ваш-аккаунт/infrastructure-setup.git
cd infrastructure-setup

## Шаг 2. Настройка переменных

cp .env.example .env
# отредактируйте .env:
#   DOMAIN, EMAIL, N8N_HOST, SUPABASE_HOST, и т.д.

## Шаг 3. Bootstrap кластера

bash scripts/bootstrap.sh

Этот скрипт установит:
k3s + kubectl
Helm 3
Helmfile

## Шаг 4. Деплой сервисов
bash scripts/deploy.sh

Считает переменные из .env
Добавит нужные Helm-репо
Запустит helmfile sync
Проверить статус: kubectl get pods -A



