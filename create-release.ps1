# Script PowerShell pour créer une release GitHub
# Utilisation: .\create-release.ps1 [version]

param(
    [string]$Version = "v1.0.0"
)

Write-Host "?? Création de la release $Version..." -ForegroundColor Green

# Vérifier si le tag existe déjà
$existingTag = git tag -l | Where-Object { $_ -eq $Version }
if ($existingTag) {
    Write-Host "? Le tag $Version existe déjà" -ForegroundColor Red
    exit 1
}

# Créer le tag
Write-Host "?? Création du tag $Version..." -ForegroundColor Yellow
git tag -a $Version -m "Release $Version"

# Pousser le tag vers GitHub
Write-Host "?? Push du tag vers GitHub..." -ForegroundColor Yellow
git push origin $Version

Write-Host "? Tag $Version créé et poussé vers GitHub" -ForegroundColor Green
Write-Host "?? GitHub Actions va maintenant créer automatiquement la release..." -ForegroundColor Cyan
Write-Host "?? Vous pouvez suivre le progrès sur : https://github.com/cmoi936/ComptaFoldersCreator/actions" -ForegroundColor Blue