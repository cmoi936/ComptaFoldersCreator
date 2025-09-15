#!/bin/bash

# Script pour créer une release GitHub
# Utilisation: ./create-release.sh [version]

VERSION=${1:-v1.0.0}

echo "?? Création de la release $VERSION..."

# Vérifier si le tag existe déjà
if git tag -l | grep -q "^$VERSION$"; then
    echo "? Le tag $VERSION existe déjà"
    exit 1
fi

# Créer le tag
echo "?? Création du tag $VERSION..."
git tag -a $VERSION -m "Release $VERSION"

# Pousser le tag vers GitHub
echo "?? Push du tag vers GitHub..."
git push origin $VERSION

echo "? Tag $VERSION créé et poussé vers GitHub"
echo "?? GitHub Actions va maintenant créer automatiquement la release..."
echo "?? Vous pouvez suivre le progrès sur : https://github.com/cmoi936/ComptaFoldersCreator/actions"