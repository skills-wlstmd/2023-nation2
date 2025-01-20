chmod +x foobar-amd64
mkdir log
sudo vim /etc/systemd/system/foobar.service
sudo systemctl enable --now foobar
sudo systemctl daemon-reload
sudo systemctl restart foobar
sudo systemctl status foobar

curl https://raw.githubusercontent.com/fluent/fluent-bit/master/install.sh | sh
sudo vim /etc/fluent-bit/parsers.conf
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
date
sudo systemctl restart foobar
rm log/app.log

sudo vim /etc/fluent-bit/fluent-bit.conf
sudo systemctl restart fluent-bit
sudo systemctl status fluent-bit
sudo journalctl -u fluent-bit.service -r # debug
sudo tail -f /var/log/fluent-bit.log # debug

# Bastion 에서 실행
while true; do curl 10.1.0.66:8080; done

sudo vim /etc/crontab
sudo yum install cronie -y
sudo systemctl  enable --now crond
sudo systemctl status crond -f 

sudo vim /etc/systemd/system/shutdown-backup.service
sudo systemctl daemon-reload
sudo systemctl enable --now shutdown-backup
sudo systemctl status shutdown-backup
sudo shutdown now