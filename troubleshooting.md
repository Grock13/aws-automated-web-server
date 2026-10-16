# Troubleshooting Guide

## SSH timeout

Check:

1. EC2 instance is running
2. Status checks pass
3. Security Group allows port 22
4. Correct public IP
5. SSH source matches current IP

## SSH permission denied

Check:

1. Correct .pem key
2. Correct username
3. Key permissions

```bash
chmod 400 key.pem
