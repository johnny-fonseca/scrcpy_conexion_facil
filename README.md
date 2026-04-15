```markdown
# 📱 SCRCPY Conexión Fácil Premium v18

[![Version](https://img.shields.io/badge/version-18-blue)](https://github.com/tuusuario/scrcpy-conexion-facil)
[![Licencia](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Windows](https://img.shields.io/badge/platform-Windows%2010%2F11-0078D6)](https://github.com/tuusuario/scrcpy-conexion-facil)

**Script batch interactivo para Windows** que simplifica y potencia la conexión inalámbrica (WiFi) de [scrcpy](https://github.com/Genymobile/scrcpy) con tu dispositivo Android. Olvídate de comandos complejos: todo desde un menú intuitivo con más de 150 opciones configurables.

![Menú principal](https://via.placeholder.com/800x400/0B0B0B/00FF00?text=SCRCPY+Conexión+Fácil+Premium+v18)

---

## ✨ Características principales

- 🚀 **Modo automático robusto** – Activa TCP/IP vía USB, conecta por IP y lanza scrcpy en un solo paso.
- 🧠 **Interfaz de menús a color** – Navegación clara con atajos y organización por categorías.
- 💾 **Configuración persistente** – Guarda y recarga más de 150 parámetros de scrcpy (resolución, bitrate, audio, rotación, atajos, grabación, cámara, etc.).
- 📋 **Historial de IPs** – Guarda las últimas 10 direcciones para reconexiones rápidas.
- 🔍 **Detección automática de IP** – Obtiene la IP del dispositivo vía ADB sin necesidad de mirar en el móvil.
- ⚡ **Perfiles rápidos** – Calidad predefinida (ultra baja latencia, balanceado, alta calidad).
- 🛠️ **Funciones adicionales**:
  - Captura de pantalla rápida con nombre automático.
  - Transferencia de archivos / instalación de APKs.
  - Información detallada del dispositivo (modelo, batería, resolución, etc.).
  - Diagnóstico de red (ping, puerto ADB).
  - Exportar / importar configuración.
  - Soporte para múltiples dispositivos ADB.
- 📝 **Registro de errores** – Log automático en `scrcpy_error.log` para facilitar la solución de problemas.

---

## 📋 Requisitos

- Sistema operativo **Windows 10 / 11** (probado también en versiones anteriores).
- [scrcpy](https://github.com/Genymobile/scrcpy/releases) (ejecutable `scrcpy.exe`).
- [ADB (Platform Tools)](https://developer.android.com/tools/releases/platform-tools) (ejecutable `adb.exe`).
- Dispositivo Android con:
  - Depuración USB activada.
  - ADB por WiFi habilitado (el script lo activa automáticamente).

> **Nota:** Ambos ejecutables (`scrcpy.exe` y `adb.exe`) deben estar en la misma carpeta que el script `.bat`.

---

## 🚀 Instalación

1. **Clona o descarga** este repositorio en tu PC.
   ```bash
   git clone https://github.com/tuusuario/scrcpy-conexion-facil.git
```

1. Coloca los archivos scrcpy.exe y adb.exe (y sus dependencias) dentro de la carpeta del script.
2. Ejecuta inalambrico_scrcpy_wifi_-_20.bat haciendo doble clic.

El script creará automáticamente los archivos de configuración, historial y log en la misma carpeta.

---

🎮 Uso rápido

1. Conecta tu Android por USB al PC.
2. Abre el script y selecciona la opción [5] Conexión completa automática.
3. Elige la IP de tu dispositivo (o deja que la detecte automáticamente).
4. ¡Listo! scrcpy se iniciará con la configuración guardada.

Menú principal:

```
 [1] Ver dispositivos ADB
 [2] Activar modo TCP/IP (USB requerido)
 [3] Conectar por IP (WiFi)
 [4] Iniciar scrcpy directamente
 [5] Conexión completa automática (RECOMENDADO)
 [6] Configurar scrcpy
 [7] Limpiar dispositivos offline
 [8] Ver log de errores
 [9] Borrar historial y configuración
 [0] Salir
```

Dentro del menú de configuración ([6]) encontrarás acceso a todas las opciones avanzadas.

---

🗂️ Estructura de archivos

Archivo Descripción
inalambrico_scrcpy_wifi_-_20.bat Script principal
scrcpy_config.txt Configuración persistente (se crea automáticamente)
scrcpy_ip_history.txt Historial de IPs (últimas 10)
scrcpy_error.log Registro de errores
scrcpy_config.bak Backup automático de la configuración
capturas\ Directorio por defecto para screenshots

---

🖼️ Capturas de pantalla

Menú principal Configuración avanzada
https://via.placeholder.com/400x300/0B0B0B/FFFFFF?text=Menú+principal https://via.placeholder.com/400x300/1E1E1E/FFFFFF?text=Configuración+avanzada

---

❓ Solución de problemas

Problema Posible solución
"No se encontró adb.exe" Asegúrate de que adb.exe esté en la misma carpeta que el script.
"No se detectó ningún dispositivo USB" Verifica que la depuración USB esté activada y que el cable funcione.
Conexión WiFi falla después de desconectar USB Ejecuta [2] Activar modo TCP/IP con USB conectado antes de ir por WiFi.
El audio no funciona En Configuración avanzada > Audio cambia el codec o el origen.
scrcpy se cierra inesperadamente Revisa scrcpy_error.log y comprueba que los ejecutables sean compatibles.

---

🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si encuentras un error o tienes una mejora:

1. Haz un fork del repositorio.
2. Crea una rama con tu mejora (git checkout -b feature/nueva-funcion).
3. Haz commit de tus cambios (git commit -am 'Añade nueva función').
4. Sube la rama (git push origin feature/nueva-funcion).
5. Abre un Pull Request.

---

📄 Licencia

Este proyecto se distribuye bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.

---

🙏 Créditos

· scrcpy – Genymobile.
· ADB (Android Debug Bridge) – Google.
· Script desarrollado con ❤️.

---

⭐ Si te resulta útil, no olvides darle una estrella al repositorio.
¿Preguntas o sugerencias? Abre un Issue.

```
