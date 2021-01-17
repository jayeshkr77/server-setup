#Variables
initial_user="jknet"
initial_server="jknet"
initial_domain="jknet.ml"

#sudo apt update
sudo apt-get update -y && sudo apt-get upgrade -y

#install ufw firewall
sudo apt install ufw

#################### UFW configuration ####################
#deny all incoming connections and then open only ones reqired
sudo ufw default deny incoming
sudo ufw default allow outgoing

#To allow listining on port 22,80,443
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https

#For specific IP Addresses
#sudo ufw allow from 203.0.113.4
#or
#sudo ufw allow from 203.0.113.4 to any port 22

#Enable UFW
sudo ufw enable 
#################### End of UFW configuration ####################

#################### Nginx configuration ####################
sudo apt install nginx
#allow Nginx HTTP and Nginx HTTPS
sudo ufw allow 'Nginx Full'
sudo systemctl start nginx
#Restart nginx without dropping connections.
sudo systemctl reload nginx

#On boot 
#sudo systemctl enable nginx

#jknet is site name
sudo mkdir -p /var/www/$initial_server/html
sudo chown -R $USER:$USER /var/www/$initial_server/html
sudo chmod -R 755 /var/www/$initial_server

#Creating home page
cat > /var/www/$initial_server/html/index.html << EOL
<html>
    <head>
        <title>Welcome to $initial_server!</title>
    </head>
    <body>
        <h1>Success!  The $initial_domain server block is working!</h1>
    </body>
</html>
EOL

#Creating new server block
cat > /etc/nginx/sites-available/$initial_server << EOL
server {
        listen 80;
        listen [::]:80;

        root /var/www/$initial_server/html;
        index index.html index.htm index.nginx-debian.html;

        server_name $initial_domain www.$initial_domain;

        location / {
                try_files $uri $uri/ =404;
        }
}
EOL

#Enabling the file by creating link from it to the site-enabled dir
sudo ln -s /etc/nginx/sites-available/$initial_server /etc/nginx/sites-enabled/

#Do this mannually
#sudo vi /etc/nginx/nginx.conf
#Uncomment server_names_hash_bucket_size 64;
#Test nginx with sudo nginx -t
#Restart server sudo systemctl restart nginx
#################### End of Nginx configuration ####################

#Install git 
sudo apt-get install git

#Install NodeJS
sudo apt install nodejs
sudo apt install npm