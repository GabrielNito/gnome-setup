#      /$$                           /$$                          
#     | $$                          | $$                          
#     | $$$$$$$   /$$$$$$   /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$$
#     | $$__  $$ |____  $$ /$$_____/| $$__  $$ /$$__  $$ /$$_____/
#     | $$  \ $$  /$$$$$$$|  $$$$$$ | $$  \ $$| $$  \__/| $$      
#     | $$  | $$ /$$__  $$ \____  $$| $$  | $$| $$      | $$      
#  /$$| $$$$$$$/|  $$$$$$$ /$$$$$$$/| $$  | $$| $$      |  $$$$$$$
# |__/|_______/  \_______/|_______/ |__/  |__/|__/       \_______/
# 
# https://www.patorjk.com/software/taag/#p=display&f=Big%20Money-ne&t=.bashrc

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias bruh="neofetch --ascii ~/Customization/Ascii/bruh"
alias walter-white="neofetch --ascii ~/Customization/Ascii/walter-white"
alias cleitin="neofetch --ascii ~/Customization/Ascii/cleitin"

pokemon-colorscripts -r
bash_prompt() {
    Purple="$(tput setaf 5)"
    White="$(tput setaf 7)"
    dir="$(pwd)"
    date="$(date '+%X')"
    home="/c/Users"
    if [ "$dir" = "$home" ]
    then
        width="$((($(tput cols)-${#date}-${#dir}+7)/2))"
        line="$Purple⌂$White"
        for i in `seq 2 $width`
        do
            line+=" ·"
        done

        echo $line $Purple$date
        echo "$Purple❱ $White"
    else
        width="$((($(tput cols)-${#date}-${#dir}+1)/2))"
        line="$Purple$dir$White"
        for i in `seq 2 $width`
        do
            line+=" ·"
        done
        echo $line$Purple$date
        echo "$Purple❱ $White"
    fi
}
PS1='$(bash_prompt)'

