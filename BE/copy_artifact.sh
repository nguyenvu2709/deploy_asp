#!/bin/bash
sudo mkdir -p /var/www/eyesight.is-tech.vn/server
sudo mkdir -p /var/www/eyesight.is-tech.vn/server/logs
sudo cp -r ./Release/net6.0/* /var/www/eyesight.is-tech.vn/server
sudo supervisorctl stop nguyenvu-eyesight:*
sudo touch /etc/supervisor/conf.d/nguyenvu.conf
sudo cp supervisor.conf /etc/supervisor/conf.d/nguyenvu.conf
sudo supervisorctl update
sudo supervisorctl start nguyenvu-eyesight:*

sudo touch /etc/nginx/sites-available/nguyenvu-be.conf
sudo cp nginx.conf /etc/nginx/sites-available/nguyenvu-be.conf
sudo ln -s  /etc/nginx/sites-available/nguyenvu-be.conf /etc/nginx/sites-enabled/nguyenvu-be.conf
sudo service nginx restart
