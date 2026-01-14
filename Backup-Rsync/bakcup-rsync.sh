#!/bin/bash

# ============================================================
# Script: backup-rsync.sh
# Descripción: Realiza backups incrementales usando rsync
# Autor: Manuel Míguez Liméns
# ============================================================

# ----- Configuración -----
SOURCE="/home/manu/Documentos"
DEST="/home/manu/Documentos/scripts/backup-rsync"
EXCLUDE_FILE="/etc/backup.exclude"

# Directorio del script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOGFILE="$SCRIPT_DIR/backup-rsync.log"

# Opciones rsync
RSYNC_OPTS="-avh --delete --stats"

# ----- Crear log si no existe -----
touch "$LOGFILE"

# ----- Inicio del backup -----
echo "--------------------------------------------------" >> "$LOGFILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Inicio del backup" >> "$LOGFILE"

# ----- Comprobaciones -----
if [ ! -d "$SOURCE" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: Directorio origen no existe: $SOURCE" >> "$LOGFILE"
    exit 1
fi

if [ ! -d "$DEST" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: Directorio destino no existe: $DEST" >> "$LOGFILE"
    exit 1
fi

# ----- Ejecutar backup -----
if [ -f "$EXCLUDE_FILE" ]; then
    rsync $RSYNC_OPTS --exclude-from="$EXCLUDE_FILE" "$SOURCE/" "$DEST/" >> "$LOGFILE" 2>&1
else
    rsync $RSYNC_OPTS "$SOURCE/" "$DEST/" >> "$LOGFILE" 2>&1
fi

# ----- Resultado -----
if [ $? -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup completado correctamente" >> "$LOGFILE"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR durante el backup" >> "$LOGFILE"
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - Fin del backup" >> "$LOGFILE"
