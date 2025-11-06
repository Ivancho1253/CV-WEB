# Usar nginx con Alpine para una imagen más ligera
FROM nginx:alpine

# Establecer el directorio de trabajo
WORKDIR /usr/share/nginx/html

# Eliminar archivos por defecto de nginx
RUN rm -rf ./*

# Copiar todos los archivos del proyecto al contenedor
COPY index.html .
COPY certificados.html .
COPY style.css .
COPY style2.css .
COPY images/ ./images/

# Copiar configuración personalizada de nginx si existe
# COPY nginx.conf /etc/nginx/nginx.conf

# Exponer el puerto 80
EXPOSE 80

# Etiquetas de metadata
LABEL maintainer="ivangonzalo1253@gmail.com"
LABEL description="CV Web de Iván Cabrera"
LABEL version="1.0"

# Iniciar nginx
CMD ["nginx", "-g", "daemon off;"]
