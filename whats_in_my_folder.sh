#!/bin/bash
# EXERCICE: 7
# whats_in_my_folder.sh: Liste le contenu d'un dossier et le logs dans /tmp/logger

# - Récupérer l'ITEMument
# 	- non nul
# 	- doit être un dossier

# - pour chaque contenu du dossier:
# 	- fichier ou dossier
# 	- lecture
# 	- ecriture
# 	- executable

PATH_TO_FOLDER=$1;

Main(){
	if [[ $# != 1 ]];
	then
	    echo "ERREUR: Vous devez fournir 1 argument !";
	    echo "Vous en avez fournis: ${#}";
	    echo "Arrêt du script !";
	    exit;
	fi;

	if ! [[ -d $PATH_TO_FOLDER ]]; 
	then
		echo "ERREUR: Le chemin que vous avez saisi n'est pas un dossier !"
	    echo "Arrêt du script !";
		exit;
	fi;

	if ! [[ -r $PATH_TO_FOLDER ]]; 
	then
		echo "ERREUR: Le dossier que vous avez donné nécessite d'être lu (chmod +r) !"
	    echo "Arrêt du script !";
	    exit;
	fi;

	if [[ ${PATH_TO_FOLDER}:-1} != '/' ]]; then PATH_TO_FOLDER="${PATH_TO_FOLDER}/"; fi;

	CONTENT_LS=$(ls $PATH_TO_FOLDER)

	echo "Liste des élements dans: ${PATH_TO_FOLDER}";
	echo "- - - - - - - - - - - - - - - -";
	for item in ${CONTENT_LS}; do
		FULLY_PATH="${PATH_TO_FOLDER}${item}";
	    if [[ -f $FULLY_PATH ]]; then echo "'${item}': est de type fichier"; fi;

	    if [[ -d $FULLY_PATH ]]; then echo "'${item}': est de type dossier"; fi;

	    if [[ -L $FULLY_PATH ]]; then echo "'${item}': est de type lien"; fi;

	    if [[ -r $FULLY_PATH ]]; then echo "'${item}': est lisible"; 
		else echo "'${item}' n'est pas lisible"; fi;

	    if [[ -w $FULLY_PATH ]]; then echo "'${item}': est modifiable"; 
		else echo "'${item}': n'est pas modifiable"; fi;

	    if [[ -x $FULLY_PATH ]]; then echo "'${item}': est executable"; 
		else echo "'${item}': n'est pas executable"; fi;

		echo "- - - - - - - - - - - - - - - -";
	done
}
Main $@ | tee /tmp/logger
