#!/bin/bash

echo "[+] Instalando Linux User Provisioning System"

if [ ! -f /usr/sbin/useradd.real ]; then
    echo "[+] Backup del binario original"
    mv /usr/sbin/useradd /usr/sbin/useradd.real
fi

echo "[+] Instalando wrapper"
cp useradd-wrapper.py /usr/sbin/useradd
chmod +x /usr/sbin/useradd

touch /var/log/user_provisioning.log
chmod 600 /var/log/user_provisioning.log

echo "[+] Instalación completada"
