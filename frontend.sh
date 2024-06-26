script=$(realpath "$0")
script_path=$(dirnmame "$script")
source ${script_path}/common.sh
yum install nginx -y
cp roboshop.conf /etc/nginx/default.d/roboshop.conf
rm -rf /usr/share/nginx/html/* 
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

#some files need to be created
systemctl enable nginx 
systemctl start nginx 