#!/usr/bin/env bash
set -euo pipefail

echo "1) Устанавливаем k3s..."
curl -sfL https://get.k3s.io | sh -    # одном скриптом устанавливает k3s + kubectl

echo "2) Настраиваем ~/.kube/config для пользователя $USER..."
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config

echo "3) Устанавливаем Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "4) Устанавливаем Helmfile..."
wget https://github.com/helmfile/helmfile/releases/download/v0.144.0/helmfile_linux_amd64 -O helmfile
chmod +x helmfile && sudo mv helmfile /usr/local/bin/

echo "Bootstrap completed."
