#!/bin/bash

echo "[+] Restaurando sistema original"

if [ -f /usr/sbin/useradd.real ]; then
    rm /usr/sbin/useradd
    mv /usr/sbin/useradd.real /usr/sbin/useradd
fi

echo "[+] Sistema restaurado"
