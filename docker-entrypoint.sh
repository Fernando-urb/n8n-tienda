#!/bin/sh
set -e

if [ "$1" = 'n8n' ]; then
  # Asegurar permisos en el volumen montado
  echo "Fixing permissions for /home/node/.n8n..."
  chown -R node:node /home/node/.n8n
  
  # Ejecutar n8n como usuario node usando su-exec (Alpine)
  exec su-exec node "$@"
fi

exec "$@"
