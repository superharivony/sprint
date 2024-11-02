#!/bin/bash

#Emplacement de mon webapps dans tomcat
WEBAPPS_DIR="/opt/apache-tomcat-8.5.91/webapps"

#Creation dossier de test
    if [ -d "$WEBAPPS_DIR\test" ]; then
        rm -rf "$WEBAPPS_DIR/test"
        echo "Répertoire test existant supprimé."
    fi
    mkdir -p "$WEBAPPS_DIR/test"
    echo "Répertoire test créé."

#Copie de la librairie de mon framework dans mon fichier de test
    rm -r "WEB-INF/lib/"
    cp -r "../BogosyFramework/lib" "WEB-INF/"
    echo "copie lib framework terminee"


#Compilation des controlleurs
    find src -name "*.java" > sources.txt
    javac -sourcepath src -cp /home/superharivony/Documents/Bosy/sprint/sprint/test/WEB-INF/lib/BogosyFramework.jar  -d WEB-INF/classes @sources.txt
    rm -f sources.txt

#Copie de mon WEB-INF dans le dossier test
    cp -r WEB-INF "$WEBAPPS_DIR/test/"
    echo "copie WEB-INF terminee"

#Copie de mes fichiers web dans test
    cp -r web/* "$WEBAPPS_DIR/test/"
    echo "copie des fichiers web"
