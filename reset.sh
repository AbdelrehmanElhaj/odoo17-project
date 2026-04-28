#!/bin/bash

COMPOSE=$(bash "$(dirname "$0")/.compose")

echo "=========================================="
echo "    Complete Reset"
echo "=========================================="
echo ""
echo "⚠️  WARNING: DELETES ALL DATA!"
echo ""

read -p "Type 'DELETE' to confirm: " confirm

if [ "$confirm" != "DELETE" ]; then
    echo "Cancelled"
    exit 0
fi

cd "$(dirname "$0")"

echo ""
echo "Stopping..."
$COMPOSE down

echo "Removing volumes..."
$COMPOSE down -v

echo "Starting fresh..."
$COMPOSE up -d

echo ""
echo "Waiting..."
sleep 20

echo ""
echo "✅ Reset complete!"
echo "🌐 http://localhost:8069"
