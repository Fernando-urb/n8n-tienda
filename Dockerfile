FROM n8nio/n8n:latest

USER root

# Instalar gosu para cambiar de usuario (Imagen base Debian)
RUN apt-get update && apt-get install -y gosu && rm -rf /var/lib/apt/lists/*

# Copiar script de entrada
COPY docker-entrypoint.sh /docker-entrypoint-init.sh
RUN chmod +x /docker-entrypoint-init.sh

# Crear directorio por si acaso
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

ENTRYPOINT ["/docker-entrypoint-init.sh"]
CMD ["n8n"]
