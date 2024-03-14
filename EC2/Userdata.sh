#!/bin/bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
docker pull nginx:latest
sudo docker run -d -p 8080:80 nginx:latest
sudo docker run -d -p 8081:80 nginx:latest