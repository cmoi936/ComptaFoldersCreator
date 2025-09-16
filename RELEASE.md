# Guide de Release

Ce document explique comment créer une nouvelle release de ComptaFoldersCreator.

## Processus automatisé

### Option 1: Via tag Git (recommandé)

1. **Créer et pousser un tag de version** :
   ```bash
   # Linux/macOS
   ./create-release.sh v1.0.0
   
   # Windows PowerShell
   .\create-release.ps1 v1.0.0
   ```

2. **Ou manuellement** :
   ```bash
   git tag -a v1.0.0 -m "Release v1.0.0"
   git push origin v1.0.0
   ```

### Option 2: Via GitHub Actions (manuel)

1. Aller sur l'onglet **Actions** du repository GitHub
2. Sélectionner le workflow **Release**
3. Cliquer sur **Run workflow**
4. Entrer la version (ex: `v1.0.0`)
5. Cliquer sur **Run workflow**

## Que fait le workflow de release ?

Le workflow GitHub Actions automatise les étapes suivantes :

1. **Build multi-plateforme** : Compile l'application pour Windows, Linux et macOS
2. **Publication** : Crée des exécutables self-contained (incluant .NET 8)
3. **Packaging** : Archive les exécutables (ZIP pour Windows, TAR.GZ pour Linux/macOS)
4. **Release GitHub** : Crée automatiquement une release avec :
   - Notes de version détaillées
   - Fichiers de téléchargement pour chaque plateforme
   - Instructions d'utilisation

## Structure des artefacts

Chaque release contient :

- `ComptaFoldersCreator-Windows-win-x64.zip` - Version Windows
- `ComptaFoldersCreator-Linux-linux-x64.tar.gz` - Version Linux  
- `ComptaFoldersCreator-macOS-osx-x64.tar.gz` - Version macOS

## Workflows disponibles

### 1. Release Workflow (`.github/workflows/release.yml`)
- **Déclencheurs** : Push de tag `v*.*.*` ou exécution manuelle
- **Actions** : Build, package et création de release GitHub

### 2. Build Workflow (`.github/workflows/build.yml`)
- **Déclencheurs** : Push/PR sur branches principales
- **Actions** : Tests de compilation sur toutes les plateformes

## Versioning

Le projet suit le versioning sémantique (SemVer) :
- `vMAJOR.MINOR.PATCH` (ex: `v1.0.0`)
- **MAJOR** : Changements incompatibles
- **MINOR** : Nouvelles fonctionnalités compatibles
- **PATCH** : Corrections de bugs

## Avant de créer une release

1. :white_check_mark: Tester l'application localement
2. :memo: Mettre à jour le README si nécessaire
3. :mag: Vérifier que les workflows CI passent
4. :package: Mettre à jour la version dans `ComptaFoldersCreator.csproj`
5. :floppy_disk: Commit et push les changements
6. :label: Créer le tag de release

## Post-release

Après la création de la release :
1. Vérifier que tous les artefacts sont présents
2. Tester le téléchargement et l'exécution sur une plateforme
3. Partager la release avec les utilisateurs