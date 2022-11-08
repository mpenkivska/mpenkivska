#!/bin/bash

sudo yum check-update
sudo yum update 

sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd | grep Active

sudo yum install firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld | grep Active

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https

sudo firewall-cmd --reload

echo "this is the public IP address:" `curl -4 icanhazip.com`
sudo chown -R $USER:$USER /var/www

cd /var/www/html/
echo '<!DOCTYPE html>' > index.html
echo '<html>' >> index.html
echo '<head>' >> index.html
echo '<title>Level It Up</title>' >> index.html
echo '<meta charset="UTF-8">' >> index.html
echo '</head>' >> index.html
echo '<body>' >> index.html
echo '<h1>Welcome to Level Up in Tech</h1>' >> index.html
echo '<h3>Red Team</h3>' >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html
