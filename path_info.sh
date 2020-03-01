#!/bin/bash
# EXERCICE: 4
# path_info: donne les infos sur le fichier donné en arg, si c'est un dossier ou fichier ...

ARG=$1;

if [[ $# == 1 ]];
then
		echo "Information sur '${ARG}':"
        if [[ -e $ARG ]]; then echo "'${ARG}': existe"; fi;

        if [[ -f $ARG ]]; then echo "'${ARG}': est de type fichier"; fi;

        if [[ -d $ARG ]]; then echo "'${ARG}': est de type dossier"; fi;

        if [[ -L $ARG ]]; then echo "'${ARG}': est de type lien"; fi;

        if [[ -r $ARG ]]; then echo "'${ARG}': est lisible"; 
    	else echo "'${ARG}' n'est pas lisible"; fi;

        if [[ -w $ARG ]]; then echo "'${ARG}': est modifiable"; 
    	else echo "'${ARG}': n'est pas modifiable"; fi;

        if [[ -x $ARG ]]; then echo "'${ARG}': est executable"; 
    	else echo "'${ARG}': n'est pas executable"; fi;
else
        echo "ERREUR: Vous devez fournir 1 arguments";
        echo "Vous en avez fournis: ${#}";
fi;