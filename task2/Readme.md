# System Health Monitoring & Automated Backup Scripts

This project contains two Bash scripts for **monitoring system health** and **automating backups**. Both scripts are configured with default settings for easy testing, but they can be customized for real-world usage.

---

## Table of Contents

1. [Overview](#overview)  
2. [Scripts](#scripts)  
   - [System Health Monitoring](#system-health-monitoring)  
   - [Automated Backup](#automated-backup)  
3. [Usage](#usage)  
4. [Customization](#customization)  
5. [Cron Job Automation](#cron-job-automation)  

---

## Overview

- **System Health Monitoring**: Checks CPU usage, memory usage, disk space, and running processes. Logs alerts if any metric exceeds defined thresholds.  
- **Automated Backup**: Backs up a specified directory to a destination folder (default is local). Logs success or failure of the backup operation.  

---

## Scripts

### System Health Monitoring

**File:** `system_health_monitor_test.sh`  

**Features:**

- Monitors CPU, memory, and disk usage  
- Checks if a specified process is running  
- Logs all results and alerts to `system_health_test.log`  
- Default thresholds are lowered for testing purposes  

**Default Configuration for Testing:**

```bash
CPU_THRESHOLD=50
MEM_THRESHOLD=50
DISK_THRESHOLD=10
PROCESS_NAME="bash"
LOG_FILE="./system_health_test.log"
Automated Backup
File: automated_backup_test.sh

Features:

Creates a local test source folder with a sample file

Backs up to a local destination folder using rsync

Logs success or failure to backup_test.log

Deletes old files in destination to keep it synced

Default Configuration for Testing:

bash
Copy code
SOURCE_DIR="./test_source"
DEST_DIR="./test_backup"
LOG_FILE="./backup_test.log"
Usage
Make the scripts executable:

bash
Copy code
chmod +x system_health_monitor_test.sh
chmod +x automated_backup_test.sh
Run the scripts:

bash
Copy code
./system_health_monitor_test.sh
./automated_backup_test.sh
View logs:

bash
Copy code
cat system_health_test.log
cat backup_test.log
