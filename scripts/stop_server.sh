#!/bin/bash

# Check if the Apache HTTP Server (httpd) process is currently running
isExistApp="$(pgrep httpd)"

# Only stop Apache if it is actually running (avoids errors if it's already stopped)
if [[ -n $isExistApp ]]; then
    sudo systemctl stop httpd.service
fi

# Check if the Tomcat process is currently running
isExistApp="$(pgrep tomcat)"

# Only stop Tomcat if it is actually running (avoids errors if it's already stopped)
if [[ -n $isExistApp ]]; then
    sudo systemctl stop tomcat.service
fi