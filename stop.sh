#!/bin/bash

COMPOSE=$(bash "$(dirname "$0")/.compose")

echo "🛑 Stopping Odoo 17..."
cd "$(dirname "$0")"
$COMPOSE down

echo ""
echo "✅ Stopped"
echo "To start: ./start.sh"
