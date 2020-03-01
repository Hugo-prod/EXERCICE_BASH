#!/bin/bash
# EXERCICE: 3
# file_info.sh: tester un fichier
# 	- Si il existe
# 	- Si il est de type fichier
# 	- Si il est lisible

FILE=$1;

if [[ $# == 1 ]];
then
        echo "Vous avez fourni en argument:${#}";

        if [[ -e $FILE ]]; then echo "Le fichier existe";
        else echo "Le fichier n'existe pas"; fi;

        if [[ -f $FILE ]]; then echo "Le fichier est de type fichier";
        else echo "Le fichier n'est pas de type fichier"; fi;

        if [[ -r $FILE ]]; then echo "Le fichier est de type lisible";
        else echo "Le fichier n'est pas de type lisible"; fi;
else
        echo "ERREUR: Vous devez fournir 1 arguments";
        echo "Vous en avez fournis: ${#}";
fi;
