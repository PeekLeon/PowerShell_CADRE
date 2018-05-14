<#
.SYNOPSIS
Encadrer un texte

.DESCRIPTION
Fonction permettant d'encadrer un texte

.PARAMETER largeur
Nombre de fois ou le caractére choisi sera répété. Si le texte est trop grand la largeur est automatiquement agrandie.

.PARAMETER caractere
Caractére(s) qui constitue le cadre

.PARAMETER border
Créer un cadre avec une ligne simple ou double. Si utilisé remplace le param caractere

.PARAMETER text
Texte contenu dans le cadre

.PARAMETER textalign
alignement du text : left/center/right

.EXAMPLE
cadre -text "$env:USERNAME" -border simple -textalign center -largeur 80
.EXAMPLE
cadre -text "$env:USERNAME" -caractere "*" -textalign center -largeur 80
.EXAMPLE
cadre -text "$env:USERNAME `n $(get-date)"  -caractere "*" -textalign "center" -largeur 80
#>
function cadre([int]$largeur=1, [string]$caractere="-", [string]$text, [string]$textalign="left", [ValidateSet("simple", "double")][string]$border){

    $aText=$text.Split("`n")

    # Test le texte le plus long
    $nbCaracteresMax=0
    $aText | foreach-object {
    $text=$_
        if($text.Length -gt $nbCaracteresMax){
            $nbCaracteresMax=$text.Length
        }
    }

    # Si le texte le plus long est plus grand que la largeur demandée, nous agrandissons en fonction
    if($border -eq "double"){
        $caractere="═"
        if($largeur -lt 2){$largeur=2}
        $topBottom=$caractere*($largeur-2)
        if($nbCaracteresMax -gt $topBottom.Length){$topBottom=$caractere*($nbCaracteresMax+2)}
    
        $top="╔"+$topBottom+"╗"
        $bottom="╚"+$topBottom+"╝"
        $caractere="║"

        $topBottom=$topBottom+"  "
    }
    elseif($border -eq "simple"){
        $caractere="─"
        if($largeur -lt 2){$largeur=2}
        $topBottom=$caractere*($largeur-2)
        if($nbCaracteresMax -gt $topBottom.Length){$topBottom=$caractere*($nbCaracteresMax+2)}
    
        $top="┌"+$topBottom+"┐"
        $bottom="└"+$topBottom+"┘"
        $caractere="│"

        $topBottom=$topBottom+"  "
    }
    else{
        $topBottom=$caractere*$largeur
        if($nbCaracteresMax -gt $topBottom.Length){$topBottom=$caractere*($nbCaracteresMax+4)}
        $top=$topBottom
        $bottom=$topBottom
    }
    

    # Ajoute le caractére demandé de chaque coté du texte (pour chaque phrase)
    $aText | foreach-object {
        $text=$_
            switch ($textalign.tolower()){  
                center{
                    $left=$caractere+" "*((($topBottom.Length-2)-$text.Length)/2)
                    $right=" "*((($topBottom.Length-2)-$text.Length)/2)+$caractere
                }
                left{
                    $left="$caractere "
                    $right=" "*((($topBottom.Length-2)-$text.Length))+$caractere
                }
                right{
                    $left=$caractere+" "*((($topBottom.Length-2)-$text.Length-($caractere.Length+1)))
                    $right=" $caractere"
                }
            }
    
        
        if($($text.Length+$left.Length+$right.Length) -lt $topBottom.Length){$left=$left+" "}
        if($($text.Length+$left.Length+$right.Length) -gt $topBottom.Length){$right=$right.Remove(1,($text.Length+$left.Length+$right.Length)-$topBottom.Length)}
    
        $contenu+=$left+$text+$right+"`n"
    }

    Return "$top`n$contenu$Bottom"
}

cadre -text "123" -largeur 100
