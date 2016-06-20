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
mongoimport --db samples --collection zips --drop --file zips.json
mongoimport --db samples --collection restaurants --drop --file restaurants.json
```

### Importar la colección people desde un CSV
Ejecutar el siguiente script:
```bash
cd /home/centos/mongodb-src/data
mongoimport --db samples --collection people --type csv --headerline --file people.csv
```

### Importar un XML usando una herramienta externa
Ejecutar el siguiente script:
```bash
sudo yum install -y xmlstarlet
echo "ssn;name;lastname;email;gender;company" > data/persons.csv
xmlstarlet sel -T -t -m /persons/person -v "concat(@ssn,';',@name,';',@lastname,';',email,';',gender,';',company)" -n data/persons.xml >> data/persons.csv
mongoimport --db samples --collection people --type csv --headerline --file persons.csv
```

