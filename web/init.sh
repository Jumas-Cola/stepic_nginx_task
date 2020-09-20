sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo /etc/init.d/mysql start
mkdir /etc/gunicorn.d
sudo ln -s /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test
cd /home/box/web/ask
gunicorn -c /etc/gunicorn.d/test ask.wsgi
