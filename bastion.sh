yum install jq curl -y --allowerasing

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

python3 -m  ensurepip
pip3 install parquet-tools

sed -i 's/#Port 22/Port 4272/' /etc/ssh/sshd_config
sed -i 's/#SyslogFacility AUTH/SyslogFacility AUTH/' /etc/ssh/sshd_config
sed -i 's/#LogLevel INFO/LogLevel VERBOSE/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# ----------------------------------------

sudo useradd -m user01
sudo useradd -m user02
sudo useradd -m user03

sudo passwd user01 # pAss@@12
sudo passwd user02 # pAss@@12
sudo passwd user03 # pAss@@12

curl https://raw.githubusercontent.com/fluent/fluent-bit/master/install.sh | sh

sudo dnf install rsyslog -y
sudo systemctl enable rsyslog --now
sudo cat /var/log/secure

sudo vim /etc/fluent-bit/fluent-bit.conf
sudo systemctl enable --now fluent-bit

sudo yum install fail2ban -y
sudo systemctl enable fail2ban.service
sudo vim /etc/fail2ban/jail.local
sudo systemctl restart fail2ban.service
sudo systemctl status fail2ban.service
