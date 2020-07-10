#!/bin/bash

sudo su
sudo cp -f ./start/id_rsa ~/.ssh
sudo cp -f ./start/id_rsa.pub ~/.ssh
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
