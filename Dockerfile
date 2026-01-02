FROM n8nio/n8n:alpine

USER root

# Instalar su-exec para cambiar de usuario (Alpine)
RUN apk add --no-cache su-exec

# Copiar script de entrada
COPY docker-entrypoint.sh /docker-entrypoint-init.sh
RUN chmod +x /docker-entrypoint-init.sh

# Crear directorio por si acaso y asignar permisos
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

ENTRYPOINT ["/docker-entrypoint-init.sh"]
CMD ["n8n"]
