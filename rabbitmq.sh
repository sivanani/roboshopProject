script=$(realpath "$0")
script_path=$(dirnmame "$script")
source ${script_path}/common.sh
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
yum install rabbitmq-server -y 
systemctl enable rabbitmq-server 
systemctl start rabbitmq-server 
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"