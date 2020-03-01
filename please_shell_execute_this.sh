#!/bin/bash
# EXERCICE: 9
# please_shell_execute_this.sh: execute une commande donné en argument et dit si elle s'est bien executé 

CMD=$1 

if [[ $# == 0 ]];
then
	echo "ERREUR: Vous devez fournir au moins 1 argument !";
	echo "Vous en avez fournis: ${#}";
	echo "Arrêt du script !";
	exit;
fi;


if [[ ! $(command -v ${CMD}) ]]; then
	echo "Erreur: ce que vous avez saisi n'est pas une commande"
	echo "Arrêt du script !";
	exit;
fi;

ERROR=''
if [[ $# > 1 ]]; then
	$*;
	ERROR=$?;
else
	${CMD};
	ERROR=$?;
fi;

if [[ ${ERROR} == 0 ]]; then
	echo "Succès: La commande s'est déroulée avec succès !"
else
	echo "Erreur: la commande ne s'est pas bien déroulé !"
fi;