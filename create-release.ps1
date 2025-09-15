# Script PowerShell pour cr�er une release GitHub
# Utilisation: .\create-release.ps1 [version]

param(
    [string]$Version = "v1.0.0"
)

Write-Host "?? Cr�ation de la release $Version..." -ForegroundColor Green

# V�rifier si le tag existe d�j�
$existingTag = git tag -l | Where-Object { $_ -eq $Version }
if ($existingTag) {
    Write-Host "? Le tag $Version existe d�j�" -ForegroundColor Red
    exit 1
}

# Cr�er le tag
Write-Host "?? Cr�ation du tag $Version..." -ForegroundColor Yellow
git tag -a $Version -m "Release $Version"

# Pousser le tag vers GitHub
Write-Host "?? Push du tag vers GitHub..." -ForegroundColor Yellow
git push origin $Version

Write-Host "? Tag $Version cr�� et pouss� vers GitHub" -ForegroundColor Green
Write-Host "?? GitHub Actions va maintenant cr�er automatiquement la release..." -ForegroundColor Cyan
Write-Host "?? Vous pouvez suivre le progr�s sur : https://github.com/cmoi936/ComptaFoldersCreator/actions" -ForegroundColor Blue