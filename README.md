# Tarea Clase 4

Los comandos utilizados para ejecutar la tarea son los siguientes:

```bash
# Construir la imagen springapp
docker build -t springapp .

# Crear la Red
docker network create mired

# Ejecutar la BD MariaDB
docker run --name=db -e MYSQL_DATABASE=bdtest -e MYSQL_ROOT_PASSWORD=123456 --network=mired -d mariadb

# Ejecutar el contenedor springapp
docker run --name=springc -p 8080:8080 --network=mired -d springapp
```


y se puede probar con los siguientes comandos con CURL:

```bash
# Crea un tutorial nuevo
curl --location --request POST 'http://localhost:8080/api/tutorials' \
--header 'Content-Type: application/json' \
--data-raw '{
    "title": "Springboot + Docker for Dummies",
    "description": "Como subir un servicio realizado en Springboot con contenedores en Docker.",
    "published": true
}'

# Obtiene una lista de los tutoriales
curl --location --request GET 'http://localhost:8080/api/tutorials'
```
