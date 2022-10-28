#!/bin/bash

# update apt cache and Linux OS
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

# install Nginx and Git
sudo apt-get install -y nginx
sudo apt install -y git-all 

# stop the nginx service
sudo systemctl stop nginx

###update sites-available default config file to turn Nginx SSI on
#delete the existing default web config file
sudo rm -rf /etc/nginx/sites-available/default
#copy down the new config file from github and pipe it to 'default'
sudo curl https://raw.githubusercontent.com/noahtompkins5/AzureVM/main/default | sudo tee -a /etc/nginx/sites-available/default

# remove any existing files or folders in the root directory 
sudo rm -rf /var/www/html/

# remove the existing cloned website directory and any files or subfolders
sudo rm -rf /var/www/HW6_website

# change into the /var/www/ directory so the repository is cloned into a 
# folder that is not the root web directory
cd /var/www/

# clone the repository - it is now in /var/www/HW6_website
sudo git clone https://github.com/mikecolbert/HW6_website.git

# copy recursively all files and folders into the root html directory for Nginx
sudo cp -r /var/www/HW6_website/ /var/www/html

# remove the .github folder and all subfolders and files from the root web directory
sudo rm -rf /var/www/html/.git/
sudo rm -rf /var/www/html/README.md

#start nginx
sudo systemctl start nginx