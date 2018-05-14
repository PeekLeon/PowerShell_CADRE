# Description

Permet d'encadrer un text automatiquement  en powershell

# Paramétres

**-text** Texte qui sera affiché dans le cadre

**-caractere** Caractére(s) qui constitue le cadre
>Exemple : "-", "*", "+" ...

**-largeur** Nombre de fois ou le caractére choisi sera répété. Si le texte est trop grand la largeur est automatiquement agrandie.

**-border** Créer un cadre avec une ligne simple ou double. Si utilisé remplace le param *caractere*

**-textalign** Alignement du text : left/center/right

# Exemples

Encadre *"$env:USERNAME"* avec un cadre simple, un texte aligner au centre et une largeur de 80 caractéres.

```powershell 
cadre -text "$env:USERNAME" -border simple -textalign center -largeur 80
```

Encadre *"$env:USERNAME"* avec le caractére "*", un texte aligner au centre et une largeur de 80 caractéres.

```powershell 
cadre -text "$env:USERNAME" -caractere "*" -textalign center -largeur 80
```

Encadre *"$env:USERNAME"* et la date (`n pour le retour à la ligne) avec le caractére "*", un texte aligner au centre et une largeur de 80 caractéres.

```powershell 
cadre -text "$env:USERNAME `n $(get-date)"  -caractere "*" -textalign "center" -largeur 80
```

Encadre en jaune *"$env:USERNAME"* avec un cadre simple, un texte aligner au centre et une largeur de 80 caractéres.

```powershell 
Write-Host -ForegroundColor Yellow $()cadre -text "$env:USERNAME" -border simple -textalign center -largeur 80
``` 

