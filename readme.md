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

![cadre_simple](Exemples/cadre_simple.png)

```powershell 
cadre -text "$env:USERNAME" -border simple -textalign center -largeur 80
```

![cadre_etoiles](Exemples/cadre_etoiles.png)

```powershell 
cadre -text "$env:USERNAME" -caractere "*" -textalign center -largeur 80
```
![cadre_double_2lignes](Exemples/cadre_double_2lignes.png)

```powershell 
cadre -text "$env:USERNAME `n $(get-date)"  -border double -textalign "center" -largeur 80
```

![cadre_simple_jaune](Exemples/cadre_simple_jaune.png)


```powershell 
Write-Host -ForegroundColor Yellow $(cadre -text "$env:USERNAME" -border simple -textalign center -largeur 80)
``` 

![cadre_espace_bg-noire_couleur-jaune](Exemples/cadre_espace_bg-noire_couleur-jaune.png)


```powershell 
Write-Host -BackgroundColor black  -ForegroundColor Yellow $(cadre -text "PeekLeon" -caractere " " -textalign center -largeur 80)
``` 
