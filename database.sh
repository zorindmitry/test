#!/bin/bash

sudo apt-get update
sudo apt-get install -y net-tools #для тестів
sudo apt-get install -y mysql-server

sudo systemctl start mysql

# встановлення пароля рута
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyN3wP4ssw0rd'"
sudo mysql -e "FLUSH PRIVILEGES"

sleep 15

# caseтворення бази даних та таблиці в ній
sudo mysql -e "CREATE DATABASE dzdatabase"

sudo mysql dzdatabase <<EOF
CREATE TABLE names (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Додавання імен до таблиці
INSERT INTO names (name) VALUES ('Dmytro');
INSERT INTO names (name) VALUES ('Ihor');
INSERT INTO names (name) VALUES ('Nadia');
EOF
