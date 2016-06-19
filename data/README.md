Dataset de ejemplo
==================

Instalación
-----------

Descargar el [Dataset](https://mega.co.nz/#!WVgSFYBZ!5C28emvkBqMWTlnEmYFvKxOej671tdKT7INiNsrbNQA) en el directorio **/data**

### Restaurar la colección students
Ejecutar el siguiente script:
```bash
cd /data
bunzip2 samples-database.tar.bz2
tar -xf samples-database.tar
rm samples-database.tar
mongorestore -d samples -c students samples/students.bson
rm -rf samples
```

### Importar las colecciones zips y restaurants
Ejecutar el siguiente script:
```bash
cd /home/centos/mongodb-src/data
mongoimport --db test --collection zips --drop --file zips.json
mongoimport --db test --collection restaurants --drop --file restaurants.json
```
