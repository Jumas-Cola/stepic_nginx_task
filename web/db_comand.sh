sudo /etc/init.d/mysql start && mysql -uroot -e "CREATE DATABASE db"
sudo python3 /home/box/web/ask/manage.py makemigrations
sudo python3 /home/box/web/ask/manage.py migrate

