Demos y fuentes del curso de MongoDB
====================================

Instalación
-----------

A continuación se especifica el proceso de instalación de los diferentes sistemas necesarios para ejecutar las demos.

### Instalar el repositorio clonándolo de Github:
Ejecutar el siguiente script:
```bash
sudo yum -y install git
cd
git clone https://github.com/vitongos/iscii-mongodb.git mongodb-src
chmod +x mongodb-src/deploy/*.sh
```

### Instalar MongoDB
Ejecutar el siguente script:
```bash
cd ~/mongodb-src/
deploy/mongodb.sh
```

### Instalar Eclipse
Ejecutar el siguiente script:
```bash
cd ~/mongodb-src/
deploy/eclipse.sh
```

### Instalar Java 8
Ejecutar el siguiente script:
```bash
cd ~/mongodb-src/
deploy/java8.sh
```
