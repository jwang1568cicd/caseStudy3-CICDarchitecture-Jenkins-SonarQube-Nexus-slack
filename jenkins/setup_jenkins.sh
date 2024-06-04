#!/bin/bash
sudo apt update -y

sudo apt install openjdk-11-jdk -y
sudo apt install openjdk-8-jdk -y
sudo apt install fontconfig openjdk-17-jre -y

#Installation of Jenkins

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
sudo systemctl status jenkins

