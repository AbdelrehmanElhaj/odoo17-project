#!/bin/bash

COMPOSE=$(bash "$(dirname "$0")/.compose")

echo "🔄 Restarting..."
cd "$(dirname "$0")"
$COMPOSE restart

sleep 10
echo "✅ Restarted"
echo "🌐 http://localhost:8069"
