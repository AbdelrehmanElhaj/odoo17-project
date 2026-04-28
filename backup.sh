#!/bin/bash

cd "$(dirname "$0")"

if ! docker ps | grep -q odoo17-db; then
    echo "❌ Database not running!"
    exit 1
fi

BACKUP_DIR="./backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/odoo_backup_$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"

echo "💾 Creating backup..."
docker exec odoo17-db pg_dumpall -c -U odoo17 > "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    gzip "$BACKUP_FILE"
    SIZE=$(du -h "${BACKUP_FILE}.gz" | cut -f1)
    echo "✅ Backup: ${BACKUP_FILE}.gz ($SIZE)"
else
    echo "❌ Backup failed!"
    rm -f "$BACKUP_FILE"
    exit 1
fi
