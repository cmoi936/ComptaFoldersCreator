# ComptaFoldersCreator

## Description

ComptaFoldersCreator est une application console C# qui permet de cr�er automatiquement une arborescence de dossiers organis�e pour la gestion comptable annuelle.

## Fonctionnalit�s

- [x] Cr�ation automatique d'une structure de dossiers par ann�e
- [x] Organisation par mois (01 � 12)  
- [x] Sous-dossiers standardis�s pour chaque mois :
  - **Achats** - Documents d'achat et factures fournisseurs
  - **Factures �mises** - Factures clients �mises
  - **Relev�s bancaires** - Relev�s et documents bancaires
- [x] Interface color�e pour distinguer les r�sultats
- [x] D�tection intelligente des dossiers existants
- [x] Configuration du r�pertoire de destination

## Pr�requis

- .NET 8.0 ou version ult�rieure
- Windows, macOS ou Linux

## Utilisation

1. Lancez l'application
2. Entrez l'ann�e souhait�e (ex: 2025)
3. Sp�cifiez le r�pertoire de base (optionnel, r�pertoire courant par d�faut)
4. L'application cr�era automatiquement la structure suivante :

```
[Ann�e]/
??? 01/
?   ??? Achats/
?   ??? Factures �mises/
?   ??? Relev�s bancaires/
??? 02/
?   ??? Achats/
?   ??? Factures �mises/
?   ??? Relev�s bancaires/
...
??? 12/
    ??? Achats/
    ??? Factures �mises/
    ??? Relev�s bancaires/
```

## Messages de retour

L'application utilise un syst�me de couleurs pour indiquer le r�sultat :

- **VERT** : Arborescence cr��e avec succ�s
- **CYAN** : Arborescence d�j� existante  
- **JAUNE** : Avertissement (ann�e invalide)
- **ROUGE** : Erreur lors de la cr�ation

## Compilation et ex�cution

```bash
# Cloner le repository
git clone https://github.com/cmoi936/ComptaFoldersCreator.git

# Naviguer dans le dossier
cd ComptaFoldersCreator

# Compiler et ex�cuter
dotnet run
```

## Technologies utilis�es

- **C# 12.0**
- **.NET 8**
- **System.IO** pour la gestion des fichiers et dossiers
- **Console** avec support UTF-8 pour l'affichage

## Contribution

Les contributions sont les bienvenues ! N'h�sitez pas � :

1. Fork le projet
2. Cr�er une branche pour votre fonctionnalit�
3. Commit vos changements
4. Pousser vers la branche
5. Ouvrir une Pull Request

## Licence

Ce projet est sous licence libre. Vous pouvez l'utiliser, le modifier et le distribuer selon vos besoins.

## Auteur

Cr�� pour faciliter l'organisation des documents comptables et am�liorer la productivit� des professionnels de la comptabilit�.