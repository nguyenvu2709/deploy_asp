#!/bin/bash
sudo mkdir -p /var/www/eyesight.is-tech.vn/html
sudo cp -r ./build/* /var/www/eyesight.is-tech.vn/html
sudo touch /etc/nginx/sites-available/nguyenvu.conf
sudo cp nginx.conf /etc/nginx/sites-available/nguyenvu.conf
sudo ln -s  /etc/nginx/sites-available/nguyenvu.conf /etc/nginx/sites-enabled/nguyenvu.conf
