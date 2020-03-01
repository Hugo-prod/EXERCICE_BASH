#!/bin/bash
# EXERCICE: 1
# mois.sh: Affiche la 3 ieme semaine d'un mois donné en paramètres (chiffre du mois)

MOIS=$1;
CALENDRIER=`cal -m ${MOIS} | tail -n 4 | head -n 1`;

echo "Voici le calendrier pour le mois: ${MOIS}";
echo "$CALENDRIER";