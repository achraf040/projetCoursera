#!/bin/bash

# Fonction pour obtenir le nombre de fichiers dans le répertoire courant
get_file_count() {
    echo $(ls -1 | wc -l) # Compte les fichiers visibles dans le répertoire courant
}

# Message d'introduction
echo "Bienvenue dans le jeu de devinettes !"
echo "Votre objectif est de deviner combien de fichiers se trouvent dans le répertoire actuel."

# Obtenir le nombre de fichiers
file_count=$(get_file_count)

# Boucle jusqu'à ce que l'utilisateur devine correctement
while true; do
    read -p "Entrez votre estimation : " guess

    # Vérifier si l'entrée est un nombre
    if ! [[ $guess =~ ^[0-9]+$ ]]; then
        echo "Veuillez entrer un nombre valide."
        continue
    fi

    # Comparer l'estimation à la réponse
    if [[ $guess -eq $file_count ]]; then
        echo "Félicitations ! Vous avez trouvé le bon nombre de fichiers : $file_count."
        break
    elif [[ $guess -lt $file_count ]]; then
        echo "Trop bas ! Essayez à nouveau."
    else
        echo "Trop haut ! Essayez à nouveau."
    fi
done
