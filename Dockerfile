FROM n8nio/n8n:latest

USER root

# Instalar su-exec para cambiar de usuario (la imagen base es Alpine)
RUN apk add --no-cache su-exec

# Copiar script de entrada
COPY docker-entrypoint.sh /docker-entrypoint-init.sh
RUN chmod +x /docker-entrypoint-init.sh

# Crear directorio por si acaso
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# El contenedor correrá como root inicialmente para poder ejecutar el chown del entrypoint
ENTRYPOINT ["/docker-entrypoint-init.sh"]
CMD ["n8n"]
