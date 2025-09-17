#!/bin/bash

# ----------------- CONFIGURATION -----------------
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
PROCESS_NAME="nginx"  
LOG_FILE="./system_health.log"
# -------------------------------------------------

echo "---- System Health Check: $(date) ----" >> $LOG_FILE

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "ALERT: CPU usage is high: ${CPU_USAGE}%" >> $LOG_FILE
else
    echo "CPU usage: ${CPU_USAGE}%" >> $LOG_FILE
fi

# Memory Usage
MEM_USAGE=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    echo "ALERT: Memory usage is high: ${MEM_USAGE}%" >> $LOG_FILE
else
    echo "Memory usage: ${MEM_USAGE}%" >> $LOG_FILE
fi

# Disk Usage
DISK_USAGE=$(df / | tail -1 | awk '{print int($5)}')
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "ALERT: Disk usage is high: ${DISK_USAGE}%" >> $LOG_FILE
else
    echo "Disk usage: ${DISK_USAGE}%" >> $LOG_FILE
fi

# Process Check
if pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "Process $PROCESS_NAME is running." >> $LOG_FILE
else
    echo "ALERT: Process $PROCESS_NAME is NOT running!" >> $LOG_FILE
fi

echo "--------------------------------------" >> $LOG_FILE
