#!/bin/bash

dnf update -y

dnf install nginx -y

systemctl start nginx
systemctl enable nginx

cat > /usr/share/nginx/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>DevOps Bootcamp AWS Project</title>
</head>
<body>
    <h1>Automated AWS Web Server</h1>
    <p>This EC2 instance was configured automatically using User Data.</p>

    <h2>Technologies</h2>
    <ul>
        <li>AWS EC2</li>
        <li>Amazon Linux</li>
        <li>Nginx</li>
        <li>EC2 User Data</li>
        <li>Bash</li>
    </ul>
</body>
</html>
EOF

mkdir -p /usr/share/nginx/html/health

echo "OK" > /usr/share/nginx/html/health/index.html

mkdir -p /home/ec2-user/scripts

cat > /home/ec2-user/scripts/web-check.sh <<'EOF'
#!/bin/bash

echo "=========================="
echo "WEB SERVER HEALTH CHECK"
echo "=========================="

echo ""
echo "Hostname:"
hostname

echo ""
echo "Nginx Status:"
systemctl is-active nginx

echo ""
echo "Port 80:"
ss -lnt | grep :80

echo ""
echo "HTTP Status:"
curl -s -o /dev/null -w "%{http_code}\n" http://localhost

echo ""
echo "Disk Usage:"
df -h /

echo ""
echo "Memory:"
free -h
EOF

chmod +x /home/ec2-user/scripts/web-check.sh
chown -R ec2-user:ec2-user /home/ec2-user/scripts
