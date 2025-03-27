 #!/bin/bash
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
yum install -y iptables-services
systemctl start iptables.service
systmectl enable iptables.service
iptables -F
iptables -t nat -A POSTROUTING -o ethO -j MASQUERADE  
service iptables save
