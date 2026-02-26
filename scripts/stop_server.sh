#!/bin/bash

# Check if the Apache HTTP Server (httpd) process is running
isExistApp="$(pgrep httpd)"

# If httpd is running, stop the httpd service
if [[ -n $isExistApp ]]; then
  sudo systemctl stop httpd.service
fi

# Check if the Tomcat process is running
isExistApp="$(pgrep tomcat)"

# If Tomcat is running, stop the tomcat service
if [[ -n $isExistApp ]]; then
  sudo systemctl stop tomcat.service
fi