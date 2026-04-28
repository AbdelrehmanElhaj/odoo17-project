#!/bin/bash
set -e

echo "[deploy] $(date) - Starting deployment..."

cd ~/odoo17

# Pull latest custom addons if any
if [ -d ~/odoo-docker-quickstart ]; then
    echo "[deploy] Pulling latest from repo..."
    cd ~/odoo-docker-quickstart
    git pull origin main
    cd ~/odoo17
fi

# Copy updated addons
cp -r ~/odoo-docker-quickstart/addons/. ~/odoo17/addons/ 2>/dev/null || true

# Restart Odoo to pick up changes
echo "[deploy] Restarting Odoo..."
./restart.sh

# Health check
echo "[deploy] Running health check..."
sleep 15
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8069/web/health || echo "000")

if [[ "$HTTP_CODE" == "200" ]]; then
    echo "[deploy] ✅ Health check passed"
else
    echo "[deploy] ❌ Health check failed (HTTP $HTTP_CODE)"
    exit 1
fi

echo "[deploy] $(date) - Deployment complete!"
