# --------------------reference---------------------
# | https://docs.docker.com/engine/install/ubuntu/ |
# --------------------------------------------------

# --- running on ubuntu --- #

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# update the repository
sudo apt-get update -y

#curl
sudo apt-get install ca-certificates curl gnupg lsb-release make -y

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo apt-get update -y

# set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#install docker engine
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo apt install docker-compose -y
sudo apt-get update -y

##docker-compose
#sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose

# Receiving a GPG error when running apt-get update?
# sudo chmod a+r /etc/apt/keyrings/docker.gpg

# run root
sudo groupadd docker
sudo usermod -aG docker $USER #yeju
sudo service docker restart
sudo apt-get update -y
sudo apt-get upgrade -y

#restart machine!