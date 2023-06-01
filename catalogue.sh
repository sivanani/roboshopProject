curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
echo -e "\e[36m>>>>> Add Application user <<<<<<<\e[0m"
useradd roboshop
rm -rf /app
mkdir /app 
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 
unzip /tmp/catalogue.zip
npm install 
cp /home/centos/roboshopProject/catalogue.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue 
systemctl restart catalogue

cp /home/centos/roboshopProject/mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.devopsr72.online </app/schema/catalogue.js