# Get key
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add 
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

sudo apt-get update -y
sudo apt-get upgrade -y

# Install mongodb
sudo apt-get install -y mongodb-org

# remoe the default .conf and replace with our configuration
sudo rm /etc/mongod.conf
sudo ln -s /home/ubuntu/environment/mongod.conf /etc/mongod.conf

# if mongo is is set up correctly these will be successful
sudo systemctl restart mongod
sudo systemctl enable mongod
