#https://github.com/pi-hole/pi-hole/blob/master/automated%20install/basic-install.sh

Install homeassistant 

Minimal

yum install centos-release-scl -y
yum install rh-python35 -y
yum install gcc -y

yum update -y
yum upgrade -y
yum install python-pip python3-dev -y
pip install --upgrade virtualenv
pip install --upgrade pip -y

adduser --system homeassistant
addgroup homeassistant

mkdir /srv/homeassistant
chown homeassistant:homeassistant /srv/homeassistant

scl enable rh-python35 bash
python --version

virtualenv -p python3 /srv/homeassistant
source /srv/homeassistant/bin/activate

pip3 install --upgrade homeassistant

systemctl disable firewalld

(firewall-cmd --permanent --add-port=8123/tcp)
(firewall-cmd --reload)
