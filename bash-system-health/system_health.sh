#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or with sudo"
    exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_DIR="/home/user/scripts/reports"
REPORT_FILE="$REPORT_DIR/health_report_$TIMESTAMP.txt"

mkdir -p "$REPORT_DIR"

{
echo "=========================================="
echo "       SYSTEM HEALTH REPORT"
echo "=========================================="
echo ""

echo "--- DATE & TIME ---"
echo "Report Generated: $(date)"
echo ""

echo "--- SYSTEM IDENTITY ---"
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I)"
echo ""

echo "--- UPTIME ---"
uptime
echo ""

echo "--- DISK USAGE ---"
df -h /
echo ""

echo "--- MEMORY ---"
free -h
echo ""

echo "--- CPU ---"
lscpu | grep "Model name"
echo ""

echo "--- ACTIVE USERS ---"
who
echo ""

echo "--- TOP 10 PROCESSES BY CPU ---"
ps aux --sort=-%cpu | head -11
echo ""

echo "--- SSH SERVICE STATUS ---"
systemctl is-active ssh
systemctl is-enabled ssh
echo ""

echo "--- OPEN PORTS ---"
ss -tulnp
echo ""

echo "--- RECENT AUTH LOG ENTRIES ---"
tail -10 /var/log/auth.log
echo ""

echo "=========================================="
echo "       END OF REPORT"
echo "$(date)"
echo "=========================================="
} | tee "$REPORT_FILE"

echo ""
echo "Report saved as: $REPORT_FILE"


