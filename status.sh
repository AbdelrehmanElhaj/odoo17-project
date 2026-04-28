#!/bin/bash

COMPOSE=$(bash "$(dirname "$0")/.compose")
cd "$(dirname "$0")"

echo "=========================================="
echo "    Odoo 17 Status"
echo "=========================================="
echo ""

echo "📦 Containers:"
$COMPOSE ps
echo ""

if docker ps | grep -q odoo17; then
    echo "✅ Odoo is running"
    echo ""
    
    if docker exec odoo17-db pg_isready -U odoo17 > /dev/null 2>&1; then
        echo "✅ Database is healthy"
        echo ""
        echo "📊 Databases:"
        docker exec odoo17-db psql -U odoo17 -c "\l" 2>/dev/null | grep odoo || echo "No databases yet"
    else
        echo "❌ Database not responding"
    fi
    
    echo ""
    echo "🌐 http://localhost:8069"
else
    echo "⚠️  Not running"
    echo "Start: ./start.sh"
fi
echo ""
