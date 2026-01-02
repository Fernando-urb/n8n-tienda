#!/bin/sh
set -e

if [ "$1" = 'n8n' ]; then
  # Asegurar permisos en el volumen montado
  echo "Fixing permissions for /home/node/.n8n..."
  chown -R node:node /home/node/.n8n
  
  # Ejecutar n8n como usuario node usando su
  # (n8n image based on alpine uses su-exec, debian uses gosu or su)
  exec su-exec node "$@"
fi

exec "$@"
