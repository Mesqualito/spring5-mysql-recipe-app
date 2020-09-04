## Use to run mysql db docker image, optional if you're not using a local mysqldb
# see: https://bugs.mysql.com/bug.php?id=91395 and https://docs.docker.com/config/containers/resource_constraints/
# and: https://github.com/moby/moby/issues/25885
# only dev: docker run --name mysqldb -p 3306:3306 --cap-add SYS_NICE -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql
# prod min.: docker run --name mysqldb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql

# connect to mysql and run as root user
#Create Databases
CREATE DATABASE sfg_dev;
CREATE DATABASE sfg_prod;

#Create database service accounts
CREATE USER 'sfg_dev_user'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'sfg_prod_user'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'sfg_dev_user'@'%' IDENTIFIED BY 'password';
CREATE USER 'sfg_prod_user'@'%' IDENTIFIED BY 'password';

#Database grants
# DML ("schema privileges") only, no DDL-capabilities ("Administrative roles") for the users
GRANT SELECT ON sfg_dev.* to 'sfg_dev_user'@'localhost';
GRANT INSERT ON sfg_dev.* to 'sfg_dev_user'@'localhost';
GRANT DELETE ON sfg_dev.* to 'sfg_dev_user'@'localhost';
GRANT UPDATE ON sfg_dev.* to 'sfg_dev_user'@'localhost';
GRANT SELECT ON sfg_prod.* to 'sfg_prod_user'@'localhost';
GRANT INSERT ON sfg_prod.* to 'sfg_prod_user'@'localhost';
GRANT DELETE ON sfg_prod.* to 'sfg_prod_user'@'localhost';
GRANT UPDATE ON sfg_prod.* to 'sfg_prod_user'@'localhost';
GRANT SELECT ON sfg_dev.* to 'sfg_dev_user'@'%';
GRANT INSERT ON sfg_dev.* to 'sfg_dev_user'@'%';
GRANT DELETE ON sfg_dev.* to 'sfg_dev_user'@'%';
GRANT UPDATE ON sfg_dev.* to 'sfg_dev_user'@'%';
GRANT SELECT ON sfg_prod.* to 'sfg_prod_user'@'%';
GRANT INSERT ON sfg_prod.* to 'sfg_prod_user'@'%';
GRANT DELETE ON sfg_prod.* to 'sfg_prod_user'@'%';
GRANT UPDATE ON sfg_prod.* to 'sfg_prod_user'@'%';
