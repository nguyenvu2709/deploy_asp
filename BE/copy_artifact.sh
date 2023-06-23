#!/bin/bash
sudo mkdir -p /var/www/eyesight.is-tech.vn/server
sudo cp -r ./Release/net6.0/* /var/www/eyesight.is-tech.vn/server
sudo touch /etc/supervisor/conf.d/nguyenvu.conf
sudo cp supervisor.conf /etc/supervisor/conf.d/nguyenvu.conf

