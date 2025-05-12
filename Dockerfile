FROM gpappsoft/privacyidea-docker:3.11.2

# Copiamos archivos necesarios
COPY pi.cfg /privacyidea/etc/pi.cfg
COPY init.sh /init.sh
RUN chmod +x /init.sh

# Crear clave dummy para evitar errores de auditoría
RUN touch /privacyidea/dummy_key.pem

# Variables de entorno necesarias
ENV PI_AUDIT_KEY_PRIVATE=/privacyidea/dummy_key.pem
ENV PI_ADDRESS=0.0.0.0
ENV PI_PORT=8080

# Ejecutamos init en el primer arranque
CMD ["/bin/sh", "-c", "/init.sh && /usr/local/bin/docker-entrypoint.sh"]

RUN mkdir -p /etc/privacyidea && \
    touch /etc/privacyidea/uuid.txt
