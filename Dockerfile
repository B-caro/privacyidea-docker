FROM gpappsoft/privacyidea-docker:3.11.2

COPY pi.cfg /privacyidea/etc/pi.cfg

# Crear archivo dummy para evitar error de auditoría
RUN touch /privacyidea/dummy_key.pem

# Configurar variable para que el entrypoint no falle
ENV PI_AUDIT_KEY_PRIVATE=/privacyidea/dummy_key.pem

ENV PI_ADDRESS=0.0.0.0
ENV PI_PORT=8080
