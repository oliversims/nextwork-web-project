#!/bin/bash

# Start the Tomcat service immediately
sudo systemctl start tomcat.service

# Enable Tomcat to start automatically on every server reboot
sudo systemctl enable tomcat.service

# Start the Apache HTTP Server service immediately
sudo systemctl start httpd.service

# Enable Apache to start automatically on every server reboot
sudo systemctl enable httpd.service