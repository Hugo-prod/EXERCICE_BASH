#!/bin/bash
# EXERCICE: 2
# args_diff.sh: compte le nombre d'argument passé au script et les compares

if [ $# == 2 ]; 
then
	if [ $1 == $2 ]; then echo "Les deux arguments sont égaux !";
	else echo "Les deux arguments ne sont pas égaux !"; fi;
else
	echo "ERROR: Deux arguments sont requis !";
	echo "Vous en avez fournis:${#}";
fi;
