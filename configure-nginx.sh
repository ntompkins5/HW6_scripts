#!/bin/bash

# update apt cache and Linux OS
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

# install Nginx and Git
sudo apt-get install -y nginx
sudo apt install -y git-all 

# remove any existing files or folders in the root directory 
sudo rm -rf /var/www/html/

# remove the existing cloned website directory and any files or subfolders
sudo rm -rf /var/www/HW6_website

# change into the /var/www/ directory so the repository is cloned into a 
# folder that is not the root web directory
cd /var/www/

# clone the repository - it is now in /var/www/HW6_website
git clone https://github.com/noahtompkins/HW6_website.git

# copy recursively all files and folders into the root html directory for Nginx
sudo cp -r /var/www/HW6_website/ /var/www/html

# remove the .github folder and all subfolders and files from the root web directory
sudo rm -rf /var/www/html/.github/