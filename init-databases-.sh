#!/bin/bash
set -e

echo "Creating databases..."

mysql -u root -p rootpassword <<-EOSQL
    CREATE DATABASE IF NOT EXISTS db_auth;
    CREATE DATABASE IF NOT EXISTS db_driver;
    CREATE DATABASE IF NOT EXISTS db_vehicle;
    CREATE DATABASE IF NOT EXISTS db_route;
    
    GRANT ALL PRIVILEGES ON db_auth.* TO 'root'@'%';
    GRANT ALL PRIVILEGES ON db_driver.* TO 'root'@'%';
    GRANT ALL PRIVILEGES ON db_vehicle.* TO 'root'@'%';
    GRANT ALL PRIVILEGES ON db_route.* TO 'root'@'%';
    
    FLUSH PRIVILEGES;
EOSQL

echo "Databases created."