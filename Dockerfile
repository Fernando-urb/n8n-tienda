FROM n8nio/n8n:latest

USER root

# Simplemente ejecutar como root para evitar problemas de permisos con volúmenes
# n8n puede mostrar un warning, pero funcionará y escribirá sin problemas.
EXPOSE 5678

CMD ["n8n"]
