# Guide de Release

Ce document explique comment cr�er une nouvelle release de ComptaFoldersCreator.

## Processus automatis�

### Option 1: Via tag Git (recommand�)

1. **Cr�er et pousser un tag de version** :
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
2. S�lectionner le workflow **Release**
3. Cliquer sur **Run workflow**
4. Entrer la version (ex: `v1.0.0`)
5. Cliquer sur **Run workflow**

## Que fait le workflow de release ?

Le workflow GitHub Actions automatise les �tapes suivantes :

1. **Build multi-plateforme** : Compile l'application pour Windows, Linux et macOS
2. **Publication** : Cr�e des ex�cutables self-contained (incluant .NET 8)
3. **Packaging** : Archive les ex�cutables (ZIP pour Windows, TAR.GZ pour Linux/macOS)
4. **Release GitHub** : Cr�e automatiquement une release avec :
   - Notes de version d�taill�es
   - Fichiers de t�l�chargement pour chaque plateforme
   - Instructions d'utilisation

## Structure des artefacts

Chaque release contient :

- `ComptaFoldersCreator-Windows-win-x64.zip` - Version Windows
- `ComptaFoldersCreator-Linux-linux-x64.tar.gz` - Version Linux  
- `ComptaFoldersCreator-macOS-osx-x64.tar.gz` - Version macOS

## Workflows disponibles

### 1. Release Workflow (`.github/workflows/release.yml`)
- **D�clencheurs** : Push de tag `v*.*.*` ou ex�cution manuelle
- **Actions** : Build, package et cr�ation de release GitHub

### 2. Build Workflow (`.github/workflows/build.yml`)
- **D�clencheurs** : Push/PR sur branches principales
- **Actions** : Tests de compilation sur toutes les plateformes

## Versioning

Le projet suit le versioning s�mantique (SemVer) :
- `vMAJOR.MINOR.PATCH` (ex: `v1.0.0`)
- **MAJOR** : Changements incompatibles
- **MINOR** : Nouvelles fonctionnalit�s compatibles
- **PATCH** : Corrections de bugs

## Avant de cr�er une release

1. :white_check_mark: Tester l'application localement
2. :memo: Mettre � jour le README si n�cessaire
3. :mag: V�rifier que les workflows CI passent
4. :package: Mettre � jour la version dans `ComptaFoldersCreator.csproj`
5. :floppy_disk: Commit et push les changements
6. :label: Cr�er le tag de release

## Post-release

Apr�s la cr�ation de la release :
1. V�rifier que tous les artefacts sont pr�sents
2. Tester le t�l�chargement et l'ex�cution sur une plateforme
3. Partager la release avec les utilisateurs