#!/bin/bash

#Chemin vers servlet-api.jar dans mon tomcat
    LIB_SERVLET="/opt/apache-tomcat-8.5.91/lib/servlet-api.jar"
    LIB_NAMEPARAM="myFrame/lib/paranamer-2.8.jar"
    LIB_GSON="myFrame/lib/gson-2.4.jar"
# Vider dossier lib
    rm -r BogosyFramework/lib/BogosyFramework.jar;
    echo "lib vide"

#creation dossier temporaire lib
    TEMP_LIB="BogosyFramework/temp"

#creation dossier lib
    if [ -d $TEMP_LIB ]; then
        rm -rf "$TEMP_LIB"
        echo "Répertoire temporaire existant supprimé."
    fi

    mkdir -p "$TEMP_LIB"
    echo "Repertoire temporaire créé."

#compilation class Framework
    javac -cp "$LIB_SERVLET:$LIB_NAMEPARAM:$LIB_GSON" -d "$TEMP_LIB" BogosyFramework/classes/*.java
    echo "Compilation terminée"    

#creation fichier .jar
    rm BogosyFramework/lib/BogosyFramework.jar
    jar -cfv BogosyFramework.jar -C "$TEMP_LIB" .

#copie vers lib du fichier jar    
    mv BogosyFramework.jar BogosyFramework/lib/

#suppression du dossier temporaire
    rm -r "$TEMP_LIB" 

# Framework créé