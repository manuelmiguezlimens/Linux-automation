#!/usr/bin/env python3
import os
import subprocess
import sys
from datetime import datetime

LOGFILE = "/var/log/user_provisioning.log"

def log(msg):
    with open(LOGFILE, "a") as f:
        f.write(f"{datetime.now()} - {msg}\n")

def run(cmd):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True)

def get_groups():
    result = run("getent group | cut -d: -f1")
    return result.stdout.strip().split("\n")

def main():
    if len(sys.argv) < 2:
        print("Uso: useradd <usuario>")
        sys.exit(1)

    username = sys.argv[1]

    print("\n=== Linux User Provisioning System ===\n")

    fullname = input("Nombre completo: ")
    shell = input("Shell [/bin/bash]: ") or "/bin/bash"
    home = input(f"Home [/home/{username}]: ") or f"/home/{username}"
    force_pass = input("¿Forzar cambio de contraseña al primer login? (y/n): ").lower() == "y"
    add_sudo = input("¿Añadir a sudo? (y/n): ").lower() == "y"

    print("\nObteniendo grupos del sistema...\n")
    groups = get_groups()
    selected_groups = []

    for g in groups:
        if g in ["root", "daemon", "bin", "sys", "sync", "games", "man", "lp"]:
            continue
        ans = input(f"¿Añadir a grupo '{g}'? (y/n): ").lower()
        if ans == "y":
            selected_groups.append(g)

    # Crear usuario
    cmd = f"/usr/sbin/useradd.real -m -d {home} -s {shell} -c \"{fullname}\" {username}"
    r = run(cmd)

    if r.returncode != 0:
        print("❌ Error creando usuario")
        print(r.stderr)
        log(f"ERROR creando usuario {username}: {r.stderr}")
        sys.exit(1)

    # Asignar grupos
    if selected_groups:
        grp_cmd = f"usermod -aG {','.join(selected_groups)} {username}"
        run(grp_cmd)

    if add_sudo:
        run(f"usermod -aG sudo {username}")

    # Password
    run(f"passwd {username}")

    if force_pass:
        run(f"chage -d 0 {username}")

    log(f"Usuario creado: {username}")
    log(f"Nombre: {fullname}")
    log(f"Shell: {shell}")
    log(f"Home: {home}")
    log(f"Grupos: {','.join(selected_groups)}")
    log(f"Sudo: {add_sudo}")

    print("\n✅ Usuario creado correctamente")
    print(f"Usuario: {username}")
    print(f"Home: {home}")
    print(f"Shell: {shell}")
    print(f"Grupos: {', '.join(selected_groups)}")
    if add_sudo:
        print("Sudo: SI")

if __name__ == "__main__":
    main()
