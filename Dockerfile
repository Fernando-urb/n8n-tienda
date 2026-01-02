FROM n8nio/n8n:latest

USER root

# Crear directorio y asignar permisos (Solución Railway EACCES)
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node
