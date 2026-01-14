# 🐧 Monitorización de disco en Linux

## 📌 Descripción
Este laboratorio implementa un script en **Bash** para la monitorización del uso
de disco en sistemas Linux. Su objetivo es detectar particiones con un alto nivel
de ocupación y registrar la información para tareas de mantenimiento preventivo.

El script está diseñado para ser ligero, portable y fácilmente integrable en
tareas programadas mediante `cron`.

---

## ⚙️ Funcionalidad
- 📊 Monitoriza el uso de discos locales
- 🚨 Detecta particiones que superan un umbral configurable
- 📝 Genera un archivo de log con el estado de cada ejecución
- 🧩 Script simple y fácilmente ampliable

---

## 🛠️ Requisitos
- Sistema operativo Linux
- Intérprete **Bash**
- Comando `df`

---

## ▶️ Uso

Dar permisos de ejecución al script:

```bash
chmod +x disk-monitor.sh
```

---

## ⚠️ Nota: 

Asegúrate de que el archivo tenga finales de línea en formato LF (Linux). Si fue editado en Windows, puede ser necesario convertirlo con `dos2unix`.

--- 
## 🗂️ Logs

El script genera un archivo disk-monitor.log en la misma carpeta donde se
encuentra el script.

El log incluye:

- ⏱️ Fecha y hora de ejecución

- 💽 Sistema de archivos y punto de montaje

- 📉 Porcentaje de uso de disco

- 🚨 Alertas cuando se supera el umbral configurado

## 🏢 Caso de uso real

Este script puede utilizarse como:

- 🕒 Tarea programada mediante cron

- 🔍 Herramienta de diagnóstico rápido

- 🛡️ Medida de mantenimiento preventivo en servidores Linux.

---

## 🚀 Posibles mejoras

- 📧 Envío de alertas por correo electrónico

- 📄 Exportación de resultados a CSV

- 🔔 Integración con sistemas de monitorización

- 📡 Notificaciones remotas

---
## 📹 Demostración

Si quieres ver cómo se ejecuta el script y cómo se genera el archivo de logs, puedes ver el el video de demostraión haciendo click [aquí](.\Demo.mp4) ⏯️