# ComptaFoldersCreator

## Description

ComptaFoldersCreator est une application console C# qui permet de créer automatiquement une arborescence de dossiers organisée pour la gestion comptable annuelle.

## Fonctionnalités

- [x] Création automatique d'une structure de dossiers par année
- [x] Organisation par mois (01 à 12)  
- [x] Sous-dossiers standardisés pour chaque mois :
  - **Achats** - Documents d'achat et factures fournisseurs
  - **Factures émises** - Factures clients émises
  - **Relevés bancaires** - Relevés et documents bancaires
- [x] Interface colorée pour distinguer les résultats
- [x] Détection intelligente des dossiers existants
- [x] Configuration du répertoire de destination

## Prérequis

- .NET 8.0 ou version ultérieure
- Windows, macOS ou Linux

## Utilisation

1. Lancez l'application
2. Entrez l'année souhaitée (ex: 2025)
3. Spécifiez le répertoire de base (optionnel, répertoire courant par défaut)
4. L'application créera automatiquement la structure suivante :

```
[Année]/
??? 01/
?   ??? Achats/
?   ??? Factures émises/
?   ??? Relevés bancaires/
??? 02/
?   ??? Achats/
?   ??? Factures émises/
?   ??? Relevés bancaires/
...
??? 12/
    ??? Achats/
    ??? Factures émises/
    ??? Relevés bancaires/
```

## Messages de retour

L'application utilise un système de couleurs pour indiquer le résultat :

- **VERT** : Arborescence créée avec succès
- **CYAN** : Arborescence déjà existante  
- **JAUNE** : Avertissement (année invalide)
- **ROUGE** : Erreur lors de la création

## Compilation et exécution

```bash
# Cloner le repository
git clone https://github.com/cmoi936/ComptaFoldersCreator.git

# Naviguer dans le dossier
cd ComptaFoldersCreator

# Compiler et exécuter
dotnet run
```

## Technologies utilisées

- **C# 12.0**
- **.NET 8**
- **System.IO** pour la gestion des fichiers et dossiers
- **Console** avec support UTF-8 pour l'affichage

## Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :

1. Fork le projet
2. Créer une branche pour votre fonctionnalité
3. Commit vos changements
4. Pousser vers la branche
5. Ouvrir une Pull Request

## Licence

Ce projet est sous licence libre. Vous pouvez l'utiliser, le modifier et le distribuer selon vos besoins.

## Auteur

Créé pour faciliter l'organisation des documents comptables et améliorer la productivité des professionnels de la comptabilité.