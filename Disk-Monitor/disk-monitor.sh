nano#!/bin/bash

# ----- Configuración -----
THRESHOLD=85

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOGFILE="$SCRIPT_DIR/disk-monitor.log"

touch "$LOGFILE"

echo "$(date '+%Y-%m-%d %H:%M:%S') - Inicio del monitoreo de discos" >> "$LOGFILE"

df -hP | grep '^/dev/' | while read -r filesystem size used avail use mount; do
    usage=${use%\%}

    echo "$(date '+%Y-%m-%d %H:%M:%S') - $filesystem en $mount: $usage% usado" >> "$LOGFILE"

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - ALERTA: $filesystem en $mount supera el $THRESHOLD%" >> "$LOGFILE"
    fi
done

echo "$(date '+%Y-%m-%d %H:%M:%S') - Fin del monitoreo de discos" >> "$LOGFILE"