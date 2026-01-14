# 🐧 Backup automatizado en Linux con rsync

## 📌 Descripción
Este laboratorio implementa un script en **Bash** que realiza **copias de seguridad
incrementales** utilizando `rsync`. Está orientado a entornos Linux y pensado para
tareas reales de administración de sistemas, como backups periódicos y
mantenimiento preventivo.

El script está preparado para ejecutarse manualmente o mediante `cron`.

---

## 🎥 Demostración en vídeo
En este repositorio puedes encontrar un **vídeo de demostración** donde se muestra
la ejecución del script, la generación de logs y el resultado del backup.

📺 **Ver demostración:**  
[▶️ Ver vídeo de demostración del backup con rsync](./demo.mp4)

---

## ⚙️ Funcionalidad
- 📂 Backups incrementales usando `rsync`
- 🗑️ Sincronización tipo espejo (`--delete`)
- 📝 Generación de logs detallados
- 🚫 Soporte para exclusión de archivos y directorios
- 🕒 Preparado para automatización con `cron`

---

## 🛠️ Requisitos
- Sistema operativo Linux
- Bash
- rsync

---

## ▶️ Uso
1. Ajusta las rutas de origen y destino dentro del script:
    ```
    SOURCE="/ruta/origen"
    DEST="/ruta/destino"```

2. Dar permisos de ejecución:
    ```
    chmod +x backup-rsync.sh```

3. Ejecutar el script:
    ```
    ./backup-rsync.sh```

4. Revisar el log generado:
    ```
    cat backup-rsync.sh```

---
## 🗂️ Logs
El script genera un archivo ```backup-rsync.log``` en el mismo directorio donde se encuentra el script, incluyendo:

- ⏱️ Fecha y hora de ejecución
- 📁 Directorios sincronizados
- 📊 Estadísticas de rsync
- ❌ Errores, si los hubiera

--- 
## 🏢 Caso de uso real

Este script puede utilizarse como:

- 🕒 Backup diario automatizado mediante cron

- 🛡️ Medida de protección ante pérdida de datos

- 🔍 Ejemplo de buenas prácticas en administración de sistemas Linux

---
## 🚀 Posibles mejoras

- 📧 Envío de alertas por correo

- 🔐 Backup remoto vía SSH

- 📄 Rotación de logs

- 🗜️ Compresión de backups