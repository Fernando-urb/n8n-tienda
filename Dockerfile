FROM n8nio/n8n:latest

USER root

# Desactivar el entrypoint por defecto de la imagen que podría intentar cambiar de usuario
ENTRYPOINT []

# Ejecutar n8n invocando el ejecutable directamente.
# En las imágenes oficiales recientes, n8n suele estar enlazado en /usr/local/bin/n8n 
# o como módulo global. Probamos invocando 'n8n' pero asegurando el PATH.
ENV PATH="/usr/local/bin:/usr/local/lib/node_modules/n8n/bin:${PATH}"

CMD ["n8n"]
