# Быстрое развёртывание стека  
(n8n, Supabase Studio, Redis, Uptime Kuma, Caddy)

**Что устанавливается**  
- PostgreSQL (Supabase DB)  
- Supabase Studio  
- n8n (с Basic Auth)  
- Redis  
- Uptime Kuma  
- Caddy (HTTPS + обратный прокси)

---

## Требования

- Ubuntu 20.04+ (или Debian-based)  
- root / sudo-доступ  

---

## Установка

```bash
ssh root@<ip>
```

```bash
sudo apt update
sudo apt install -y git
```

```bash
cd ~
```

1. Клонируем репозиторий:
   ```bash
   git clone https://github.com/beko-o/infrastructure-setup.git
   cd infrastructure-setup
   ```

2. делаем скрипты исполняемыми
   ```bash
    chmod +x install.sh configure.sh setup.sh
   ```

4. Запускаем установку:
   ```bash
    ./install.sh example.kz
   ```
    Где example.kz — домен.
   
---

Что происходит

1) configure.sh:
Генерирует файл .env
Генерирует docker-compose.yml и Caddyfile с нужными поддоменами и Basic Auth для Supabase.

2) setup.sh:
Устанавливает Docker и Docker Compose (если нужно).
Запускает все сервисы командой docker compose up -d.

--- 

done
