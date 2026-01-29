# 🐧 Linux User Provisioning System

## 📌 Descripción

Este laboratorio implementa un **sistema de provisión automática de usuarios en Linux**, integrado directamente en el sistema mediante un **wrapper real del comando** ```useradd```.

El proyecto transforma el comando estándar de creación de usuarios en un **motor de provisión inteligente**, capaz de:

- Crear usuarios de forma interactiva

- Asignar grupos dinámicamente

- Configurar parámetros del sistema

- Aplicar políticas de seguridad

- Gestionar privilegios

- Generar logs de auditoría

- Automatizar el onboarding de usuarios

Este sistema simula un **modelo básico de gestión de identidades (IAM local)** utilizado en entornos corporativos reales.

---

## 🎯 Objetivos del laboratorio

- Automatizar la creación de usuarios en Linux.

- Intgrar lógica personalizada en comandos del sistema.

- Implmentar provisión interactiva.

- Detectar grupos del sistema automáticamente.

- Asignar grupos dinámicamente.

- Configurar permisos y privilegios.

- Gestionar políticas de contraseñas.

- Implementar auditorías de acciones.

- Centralizar la administración de indentidades.

- Simular procesos reales de onboarding IT

---

⚙️ Funcionamiento

El comando estándar:

```sudo useradd usuario```


activa automáticamente el sistema de provisión, que:

1️⃣ Solicita datos del usuario

2️⃣ Configura parámetros básicos

3️⃣ Detecta los grupos reales del sistema

4️⃣ Pregunta interactivamente si se deben asignar

5️⃣ Crea el usuario

6️⃣ Asigna grupos seleccionados

7️⃣ Configura sudo (opcional)

8️⃣ Aplica políticas de contraseña

9️⃣ Genera logs de auditoría

🔟 Valida la creación del usuario

---

## 🎥 Demostración

📺 Este laboratorio incluye un vídeo de demostración donde se puede ver:

- La ejecución real del comando useradd

- El sistema interactivo de provisión

- La detección automática de grupos

- La asignación de permisos

- La creación del usuario

- La generación de logs

- La integración con el sistema

👉 Vídeo disponible en el repositorio: [ver aqui](./Demo.mp4)

---

## 👤 Autor

Manuel Míguez Liméns

[GitHub](https://github.com/manuelmiguezlimens) | [LinkedIn](https://www.linkedin.com/in/manuelmiguezlimens/) | [Gmail](mailto:miguezlimensmanuel@gmail.com)