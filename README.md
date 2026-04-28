# Odoo 17 Docker - Universal Edition

Compatible with both `docker compose` and `docker-compose`.

## 🚀 Quick Start

```bash
cd ~/odoo17
./start.sh
```

Open: **http://localhost:8069**

## 📝 First Time Setup

1. Run `./start.sh`
2. Open http://localhost:8069
3. Fill the database creation form:
   - Master Password: `admin@123`
   - Database Name: `odoo17_db`
   - Email: your-email@example.com
   - Password: choose strong password
   - Language & Country: select yours
4. Click "Create Database"
5. Wait 1-2 minutes
6. Done!

## 🛠️ Management

```bash
./start.sh      # Start
./stop.sh       # Stop
./restart.sh    # Restart
./status.sh     # Status
./logs.sh       # Logs
./backup.sh     # Backup
./reset.sh      # Reset (deletes data!)
```

## 📋 Credentials

- Master Password: `admin@123`
- DB User: `odoo17`
- DB Password: `odoo17`
- DB Name: `odoo17_db`

## 📦 Custom Modules

1. Place in `addons/` directory
2. Run `./restart.sh`
3. Update Apps List in Odoo
4. Install module

## 🔧 Troubleshooting

### Check status
```bash
./status.sh
```

### View logs
```bash
./logs.sh
```

### Complete reset
```bash
./reset.sh
```

### Manual commands
```bash
# Check which compose version
bash .compose

# Use detected version
$(bash .compose) ps
```

## 📚 Links

- Odoo: http://localhost:8069
- Database Manager: http://localhost:8069/web/database/manager
- Docs: https://www.odoo.com/documentation/17.0/
# Odoo 17 Dev — Tue Apr 28 20:52:40 UTC 2026
# test Tue Apr 28 20:58:30 UTC 2026
# test Tue Apr 28 21:02:54 UTC 2026
# test Tue Apr 28 21:04:24 UTC 2026
# test Tue Apr 28 21:10:49 UTC 2026
# test Tue Apr 28 21:13:57 UTC 2026
