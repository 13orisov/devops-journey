server {
listen 80;
listen [::]:80;
server_name borisov-devops.ru www.borisov-devops.ru;
root /var/www/borisov-devops.ru;
index index.html;
location / {
try_files $uri $uri/ =404;
}
}
