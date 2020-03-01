#!/bin/bash
# EXERCICE:6
# let_me_out.sh: demander à l'utilisateur de saisir "exit" pour sortir du programme

while [[ $INPUT != "exit" ]]; do
	read -p "Veuillez saisir 'exit' pour arrêter le programme ! :" INPUT
	if [[ $INPUT != "exit" ]]; then echo "ERREUR: vous avez saisi: '${INPUT}'"; fi;
done

echo "Bravo ! arrêt du script...";