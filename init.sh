#!/bin/sh

echo "➡️  Creando archivo de usuarios..."
echo "admin:{SHA256}8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918" > /data/users.txt

echo "➡️  Creando archivo de configuración de resolver..."
echo '{ "type": "passwdresolver", "filename": "/data/users.txt" }' > /data/resolver.conf

echo "➡️  Creando resolver..."
pi-manage resolver create adminresolver passwdresolver /data/resolver.conf

echo "➡️  Creando realm..."
pi-manage realm create adminrealm adminresolver

echo "➡️  Creando política de login para WebUI..."
pi-manage policy create loginpolicy webui login --realm adminrealm --user admin

echo "✅ Configuración inicial completada."
