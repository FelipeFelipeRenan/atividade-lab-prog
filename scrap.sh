#!/bin/bash

touch teste.txt
touch contar.txt

echo > final.txt
# arquivo com as URLs 

URLS=$(cat urls.txt)
declare -A palavras

#coletando os dados do StackOverflow

for x in $URLS;do 
    curl -s $URLS | grep 'class="post-tag flex--item"' | sed -En 's/[^>]*>([^<]*).*$/\1/p' | sort -n  >>teste.txt;
done

palavras=$(cat teste.txt)
#echo $(grep -o -c git teste.txt)

# cria o hash
declare -A palavras

# arquivo que contem o texto
file=teste.txt

# percorre cada linha
while read LINHA
do
    # percorre cada palavra
    for PALAVRA in $LINHA
    do
        # incrementa o valor
        let palavras[$PALAVRA]++
    done
done < $file

for chave in ${palavras[@]}
do
    echo "${palavras[$chave]} ocorrências de $chave"  >>  contar.txt
    
done


# uniq contar.txt unicos.txt 


sed 's/(ocorrências de )[\d]{1,2}/---------/g' contar.txt |  sort -n  | uniq  >> final.txt
rm contar.txt
rm teste.txt

show=$(cat final.txt )

echo "---------------"

tail -4 final.txt

echo "---------------"