curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app 
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip 
cd /app 
unzip /tmp/user.zip
npm install 
cp /root/roboshopProject/user.service /etc/systemd/system/user.service
systemctl daemon-reload
systemctl enable user 
systemctl start user

cp /root/roboshopProject/mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.devopsr72.online </app/schema/user.js