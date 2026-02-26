#!/bin/bash

# Install Tomcat - the Java application server that will run the web app
sudo yum install tomcat -y

# Install Apache HTTP Server - the web server that will handle incoming traffic
sudo yum -y install httpd

# Create an Apache Virtual Host configuration file that acts as a
# reverse proxy, forwarding all incoming traffic on port 80 to
# Tomcat running on port 8080
sudo cat << EOF > /etc/httpd/conf.d/tomcat_manager.conf
<VirtualHost *:80>
  # Email address of the server administrator
  ServerAdmin root@localhost

  # The domain name this virtual host responds to
  ServerName app.nextwork.com

  # Default content type for responses
  DefaultType text/html

  # Disable forward proxying (only allow reverse proxy)
  ProxyRequests off

  # Preserve the original Host header when forwarding requests
  ProxyPreserveHost On

  # Forward all incoming requests to Tomcat on port 8080
  ProxyPass / http://localhost:8080/nextwork-web-project/

  # Rewrite response headers to match the original request URL
  ProxyPassReverse / http://localhost:8080/nextwork-web-project/
</VirtualHost>
EOF