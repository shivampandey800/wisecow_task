#!/bin/bash

# ----------------- DEFAULT CONFIGURATION -----------------
SOURCE_DIR="./test_source"    # Local folder to backup
DEST_DIR="./test_backup"      # Local backup destination
LOG_FILE="./backup_test.log"
# ---------------------------------------------------------

# Create test source folder and sample file if not exists
mkdir -p $SOURCE_DIR
echo "Sample file for testing backup at $(date)" > $SOURCE_DIR/sample.txt

# Create backup folder if not exists
mkdir -p $DEST_DIR

echo "---- Backup Job: $(date) ----" >> $LOG_FILE

# Perform backup using rsync
rsync -av --delete $SOURCE_DIR/ $DEST_DIR/ >> $LOG_FILE 2>&1

# Check if backup succeeded
if [ $? -eq 0 ]; then
    echo "Backup completed successfully." >> $LOG_FILE
else
    echo "Backup FAILED!" >> $LOG_FILE
fi

echo "--------------------------------------" >> $LOG_FILE
