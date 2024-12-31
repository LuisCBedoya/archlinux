#!/usr/bin/env bash

## configure and install minimal xfce desktop environment for Arch Linux

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "Este script debe ejecutarse con sudo, inténtalo de nuevo..."
  exit 1
fi

# Instalar los paquetes necesarios para XFCE
pacman -S --noconfirm \
    libxfce4ui \
    xfce4-panel \
    xfce4-pulseaudio-plugin \
    xfce4-notifyd \
    xfce4-power-manager \
    xfce4-whiskermenu-plugin \
    xfce4-session \
    xfce4-settings \
    xfce4-docklike-plugin \
    xorg-xinit \
    xfconf \
    xfdesktop \
    xfwm4

# Crear el archivo .xinitrc con las configuraciones necesarias
echo -e '#autostart
\nexport XDG_SESSION_TYPE=x11
\nexport GDK_BACKEND=x11
\nsetxkbmap latam &
\nexec dbus-run-session startxfce4' > /home/luc/.xinitrc

# Confirmar que el archivo .xinitrc fue creado correctamente
echo "Archivo .xinitrc configurado exitosamente."

echo "Configuración completada. Ahora puedes iniciar XFCE con 'startx'."
