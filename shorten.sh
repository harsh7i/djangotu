#!/bin/bash
{
    #try
    cd
    apt update
    apt install python3 curl -y
    pip install django
    pip install django-admin
    curl -OL https://raw.githubusercontent.com/harsh7839/django-shortcut/main/django.sh && chmod +x django.sh && bash django.sh && rm shorten.sh
    
} || {
    
    #exept
    sudo apt update
    sudo apt install python3 curl -y
    sudo pip install django
    sudo pip install django-admin
    curl -OL https://raw.githubusercontent.com/harsh7839/django-shortcut/main/django.sh && chmod +x django.sh && sudo bash django.sh && sudo rm shorten.sh
}