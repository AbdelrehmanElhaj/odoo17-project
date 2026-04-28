#!/bin/bash

COMPOSE=$(bash "$(dirname "$0")/.compose")

echo "=========================================="
echo "    Starting Odoo 17"
echo "=========================================="
echo ""

cd "$(dirname "$0")"

if docker ps | grep -q odoo17; then
    echo "⚠️  Odoo is already running!"
    read -p "Restart? (yes/no): " restart
    if [ "$restart" = "yes" ]; then
        $COMPOSE restart
        echo "✓ Restarted"
    fi
    exit 0
fi

echo "🚀 Starting Odoo 17..."
$COMPOSE up -d

echo ""
echo "⏳ Waiting for services..."
for i in {1..30}; do
    if docker exec odoo17-db pg_isready -U odoo17 > /dev/null 2>&1; then
        echo "✓ Database ready"
        break
    fi
    sleep 2
    echo -n "."
done

echo ""
sleep 5

if docker ps | grep -q odoo17; then
    echo ""
    echo "=========================================="
    echo "✅ Odoo 17 is Running!"
    echo "=========================================="
    echo ""
    echo "🌐 Access: http://localhost:8069"
    echo ""
    echo "📝 First Time Setup:"
    echo "   1. Open http://localhost:8069"
    echo "   2. Fill the 'Create Database' form:"
    echo "      • Master Password: admin@123"
    echo "      • Database Name: odoo17_db"
    echo "      • Email: your-email@example.com"
    echo "      • Password: (choose password)"
    echo "      • Language & Country: select yours"
    echo "   3. Click 'Create Database'"
    echo "   4. Wait 1-2 minutes"
    echo ""
    echo "💡 Commands:"
    echo "   ./logs.sh    - View logs"
    echo "   ./stop.sh    - Stop Odoo"
    echo "   ./status.sh  - Check status"
    echo ""
else
    echo "❌ Failed to start"
    echo "Check: $COMPOSE logs"
fi
