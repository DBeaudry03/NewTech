#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install mariadb-server mariadb-client -y

# Change le mot de passe
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'DB030386';"
# Supprime utilisateur anonyme
sudo mysql -uroot -pDB030386 -e "DELETE FROM mysql.user WHERE User=';"
# Empeche root de se connecter a distance
sudo mysql -uroot -pDB030386 -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
# supprimer la bd test
sudo mysql -uroot -pDB030386 -e "DROP DATABASE IF EXISTS test;"
sudo mysql -uroot -pDB030386 -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
# forcer la recharge des privileges
sudo mysql -uroot -pDB030386 -e "FLUSH PRIVILEGES"


# creer bd NewTech
sudo mysql -uroot -pDB030386 -e -s "CREATE DATABASE IF NOT EXISTS NewTech;"
# Creer utilisateur NewTech
sudo mysql -uroot -pDB030386 -e "CREATE USER 'NewTech'@'%' IDENTIFIED BY 'lopl8788';"
# Donner droit acces
sudo mysql -uroot -pDB030386 -e "GRANT ALL PRIVILEGES ON NewTech.* TO 'NewTech'@'%';"
# forcer la recharge
sudo mysql -uroot -pDB030386 -e "FLUSH PRIVILEGES"

sudo apt autoremove -y

sudo cp /etc/mysql/mariadb.conf.d/50-server.cnf ~/50-server.cnf.bak
sudo sed -i '/^\s*bind-address\s*=/ s/127\.0\.0\.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


