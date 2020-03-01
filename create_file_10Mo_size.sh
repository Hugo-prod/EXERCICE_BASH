#!/bin/bash

# EXERCICE: 8
# create_file_10Mo_size.sh: Création d'un fichier de 10Mo avec le nom donné en argument 
# et qui sera stocké là où on le souhaite à condition que le chemin saisi soit:
# - Un dossier
# - Lisible
# - Modifiable
# - Executable 


NAME_FILE=$1
READY=false

case $# in
	0 ) echo "Veuillez donner un nom à votre fichier en argument"; echo "Arrêt du script"; exit;;
	1 ) true ;;
	* ) echo "Vous avez donné trop d'argument, veuillez en saisir 1 seul"; echo "Arrêt du script"; exit;;
esac

while [[ $READY != true ]]; do
	READY=true; ERR_NB=0;

	read -p "Veuillez saisir le chemin absolu du dossier où vous souhaitez enregistrer le fichier (ex:/tmp/):" PATH_TO_SAVE_FILE
	if [[ -z ${PATH_TO_SAVE_FILE} ]]; then echo "ERREUR: Vous n'avez rien écris: '${PATH_TO_SAVE_FILE}'"; ((ERR_NB++)); fi;
	if [[ ! ${PATH_TO_SAVE_FILE: -1} == '/' ]]; then PATH_TO_SAVE_FILE+='/'; fi;
	if [[ ! -d ${PATH_TO_SAVE_FILE} ]]; then echo "ERREUR: Ce que vous avez saisi n'est pas un chemin valide: '${PATH_TO_SAVE_FILE}'"; ((ERR_NB++)); fi;
	if [[ ! -w ${PATH_TO_SAVE_FILE} ]]; then echo "ERREUR: Le dossier n'est modifiable: '${PATH_TO_SAVE_FILE}'"; ((ERR_NB++)); fi;
	if [[ ! -x ${PATH_TO_SAVE_FILE} ]]; then echo "ERREUR: Le dossier n'est executable: '${PATH_TO_SAVE_FILE}'"; ((ERR_NB++)); fi;
	if [[ ! -r ${PATH_TO_SAVE_FILE} ]]; then echo "ERREUR: Le dossier n'est lisible: '${PATH_TO_SAVE_FILE}'"; ((ERR_NB++)); fi;
	if [[ -f ${PATH_TO_SAVE_FILE}${NAME_FILE} ]]; then echo "ERREUR: un fichier existe déjà ici: '${PATH_TO_SAVE_FILE}${NAME_FILE}'"; ((ERR_NB++)); fi;

	if [[ ${ERR_NB} > 0 ]]; then READY=false; else READY=true; fi;
done

fallocate -l 10M ${PATH_TO_SAVE_FILE}${NAME_FILE}
echo "Fichier créé:${PATH_TO_SAVE_FILE}${NAME_FILE}";