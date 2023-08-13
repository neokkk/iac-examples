#!/bin/bash

echo  "Installed successfully!"
echo "$USER" > /home/ec2-user/username.txt

chmod 400 /home/ec2-user/.ssh/id_rsa