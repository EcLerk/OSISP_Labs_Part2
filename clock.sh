#!/bin/bash

rows=20
columns=70
font_size=7

main() {
    while true; do
        local x=$((RANDOM % (columns-8) + 1))
        local y=$((RANDOM % (rows-1) + 1))
        
        local time_str=$(date +%T)
        
        clear
        
        tput cup 0 0
        echo "+$(printf '%*s' $columns | tr ' ' -)+"
        
        for ((i=1; i<=rows; i++)); do
            tput cup $i 0
            echo "|"
            tput cup $i $((columns + 1))
            echo "|"
        done
       
        tput cup $rows 0
        echo "+$(printf '%*s' $columns | tr ' ' -)+"
        
        tput setaf 3
        tput bold 
        tput cup $y $x
        printf "\e[1;${font_size}m"  # Используем ANSI Escape-код для изменения размера шрифта
        echo "$time_str"
        printf "\e[0m"  # Сброс настроек размера шрифта
    	
        sleep 1
    done
}

main
