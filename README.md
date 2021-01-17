# Server Hosting Setup for Ubuntu
## Philosophy
The Setup script will help you to perform the initial steps required to prepare the Ubuntu for hosting sites.

It will install a functioning firewall i.e, *Ufw* and deny all the incoming requests except for *HTTP*, *HTTPS*, *SSH* and then it will do Nginx configuration.

You can always comment the command, if the feature is not required.

## Features
+ Updates the Ubuntu repository.
+ Setup the firewall **UFW**.
+ Setup **Nginx**.
+ Install's **Git**.
+ Install's **NodeJS** and **npm**.

## References
1. [DigitalOcean - How to install nginx](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04)
2. [DigitalOcean - Setup a Firewall with UFW on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server)
3. [Install Node.js on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04)
