script=$(realpath "$0")
script_path=$(dirnmame "$script")
source ${script_path}/common.sh
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
echo -e "\e[36m>>>>> Add Application user <<<<<<<\e[0m"
useradd ${app_user}
rm -rf /app
mkdir /app 
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 
unzip /tmp/catalogue.zip
npm install 
cp $script_path/catalogue.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue 
systemctl restart catalogue

cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.devopsr72.online </app/schema/catalogue.js