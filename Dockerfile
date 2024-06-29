FROM ubuntu:latest

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Instalar paquetes de Python
RUN pip3 install PyYAML

# Copiar los archivos necesarios
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Asegurarse de que el script tenga permisos de ejecución
RUN chmod +x /entrypoint.sh

# Agregar depuración para verificar la presencia de los archivos
RUN echo "Verificando feed.py:" && ls -l /usr/bin/feed.py
RUN echo "Verificando entrypoint.sh:" && ls -l /entrypoint.sh

# Establecer el punto de entrada
ENTRYPOINT ["/entrypoint.sh"]
