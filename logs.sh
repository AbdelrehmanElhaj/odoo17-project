#!/bin/bash

COMPOSE=$(bash "$(dirname "$0")/.compose")

echo "📋 Logs (Ctrl+C to exit)"
echo ""
cd "$(dirname "$0")"
$COMPOSE logs -f --tail=100 web
