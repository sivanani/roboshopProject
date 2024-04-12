script=$(realpath "$0")
script_path=$(dirnmame "$script")
source ${script_path}/common.sh
yum install maven -y
useradd ${app_user}
rm -rf /app
mkdir /app 
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip 
cd /app 
unzip /tmp/shipping.zip
cd /app 
mvn clean package 
mv target/shipping-1.0.jar shipping.jar
yum install mysql -y
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql 
cp $script_path/shipping.service etc/systemd/system/shipping.service
systemctl daemon-reload
systemctl enable shipping 
systemctl start shipping