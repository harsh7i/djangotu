#!/bin/bash

# Variables
Red="\e[0;31m"
Green="\e[0;32m"
Blue="\e[0;34m"
Alert="\e[0;31m[×]"
Success="\e[0;32m[+]"
dim="\e[0;2m"
enc="\e[0;m"

# directory=django directory

phase3(){
    echo -e "$Success Success Functions List...$enc"
    echo ""
    
    echo -e "$Blue 1.runserver"
    echo -e "$Blue 2.createsuperuser"
    echo -e "$Blue 3.changepassword"
    echo -e "$Blue 4.migrate"
    echo -e "$Blue 5.makemigrations"
    echo -e "$Blue 6.startapp"
    
    echo ""
    echo -e "$Success Choose a function $enc"
    echo ""
    read -p ">> " choice
    echo ""
    
    if [[ $choice -eq 1 ]]; then
        #statements
        python manage.py runserver
    elif [[ $choice -eq 2 ]]; then
        #statements
        python3 manage.py createsuperuser
    elif [[ $choice -eq 3 ]]; then
        #statements
        python3 manage.py changepassword
    elif [[ $choice -eq 4 ]]; then
        #statements
        python3 manage.py migrate
    elif [[ $choice -eq 5 ]]; then
        #statements
        python3 manage.py makemigrations
    elif [[ $choice -eq 6 ]]; then
        #statements
        read -e -p ">> " appname
        echo ""
        django-admin startapp $appname &> /dev/null && echo -e "$Success Successfully App Created $enc"
        echo ""
    else
        echo -e "$Alert Input Error $enc"
        echo ""
    fi
    
}

phase2(){
    echo ""
    echo -e "$Success Select Your Project $enc"
    echo ""
    
    # loops
    arrDir=()
    for projects in */ ; do
        #statements
        arrDir=(${arrDir[@]} "$projects")
    done
    let i=0
    for items in "${arrDir[@]}" ; do
        #statements
        echo -e "$Blue $((i++)).$items $enc"
    done
    
    echo ""
    read -p ">> " proc
    echo ""
    if [[ $proc -le ${#arrDir[@]} ]]; then
        #statements
        cd ${arrDir[$proc]}
        phase3
    else
        echo -e "$Alert Input is not valid ! $enc"
        echo ""
    fi
}

config_file(){
    echo ""
    echo -e "$Alert Enter the Parant Directory of your django Project.$enc"
    echo ""
    read -e -p ">> " directory
    echo ""
    if [[ -d "$directory" ]]; then
        #statements
        echo "$directory" >> .config_django
        cd $directory
        phase2
    else
        echo -e "$Alert [!] Alert! Wrong Directory $enc"
        echo ""
    fi
}

echo ""
echo -e "$Success Django Shortcut Tool [ version: 1.1 ] $enc"

# directory management
if [[ -f ".config_django" ]]; then
    #statements
    directory=`cat .config_django`
    if [[ -d $directory ]]; then
        #statements
        cd $directory
        phase2
    else
        echo ""
        echo -e "$Alert Something has been Changed $enc"
        config_file
    fi
else
    config_file
fi
