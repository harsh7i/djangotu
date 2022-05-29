#!/bin/bash

#variables
Alert="\e[0;31m[×]"
General="\e[0;32m[+]"
enc="\e[0;m"
# directory=django folder

phase3(){
    echo -e "$General General Functions List...$enc"
    echo ""
    
    echo "1.runserver"
    echo "2.createsuperuser"
    echo "3.changepassword"
    echo "4.migrate"
    echo "5.makemigrations"
    echo "6.startapp"
    
    echo ""
    echo -e "$General Choose a function $enc"
    echo ""
    read -p ">> " choice
    echo ""
    
    if [[ $choice -eq 1 ]]; then
        #statements
        python manage.py runserver
    elif [[ $choice -eq 2 ]]; then
        #statements
        python manage.py createsuperuser
    elif [[ $choice -eq 3 ]]; then
        #statements
        python manage.py changepassword
    elif [[ $choice -eq 4 ]]; then
        #statements
        python manage.py migrate
    elif [[ $choice -eq 5 ]]; then
        #statements
        python manage.py makemigrations
    elif [[ $choice -eq 6 ]]; then
        #statements
        python manage.py startapp
    else
        echo -e "$Alert Input Error $enc"
        echo ""
    fi
    
}

phase2(){
    echo ""
    echo -e "$General Select Your Project $enc"
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
        echo " $((i++)).$items"
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
    echo -e "$General Enter the Parant Directory of your django Project.$enc"
    echo ""
    read -p ">> " directory
    echo ""
    if [[ -d "$directory" ]]; then
        #statements
        echo "$directory" >> config.ac
        cd $directory
        phase2
    else
        echo -e "$Alert [!] Alert! Wrong Directory $enc"
        echo ""
    fi
}

echo ""
echo -e "$General Django Shortcut Tool [ version: 1.0 ] $enc"

# directory management
if [[ -f "config.ac" ]]; then
    #statements
    directory=`cat config.ac`
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