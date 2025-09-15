#!/bin/bash

# Script pour cr�er une release GitHub
# Utilisation: ./create-release.sh [version]

VERSION=${1:-v1.0.0}

echo "?? Cr�ation de la release $VERSION..."

# V�rifier si le tag existe d�j�
if git tag -l | grep -q "^$VERSION$"; then
    echo "? Le tag $VERSION existe d�j�"
    exit 1
fi

# Cr�er le tag
echo "?? Cr�ation du tag $VERSION..."
git tag -a $VERSION -m "Release $VERSION"

# Pousser le tag vers GitHub
echo "?? Push du tag vers GitHub..."
git push origin $VERSION

echo "? Tag $VERSION cr�� et pouss� vers GitHub"
echo "?? GitHub Actions va maintenant cr�er automatiquement la release..."
echo "?? Vous pouvez suivre le progr�s sur : https://github.com/cmoi936/ComptaFoldersCreator/actions"