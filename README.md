# Automated AWS Web Server

A hands-on AWS DevOps project that automatically deploys and configures an Nginx web server on Amazon EC2.

## Project Goals

The project demonstrates:

- Linux server administration
- AWS EC2
- Security Groups
- IAM Roles
- Amazon S3
- Bash automation
- EC2 User Data
- Web server monitoring
- Troubleshooting

## Architecture

The project deploys an Amazon Linux EC2 instance running Nginx.

The EC2 instance:

- serves a custom webpage
- exposes a health endpoint
- uses an IAM role to access S3
- uploads website backups to S3
- is automatically configured with EC2 User Data

See `architecture.md` for the full architecture.

## Security

SSH access is restricted to my IP address.

HTTP traffic is allowed on port 80.

AWS credentials are not stored directly on the EC2 instance. An IAM role is used instead.

## Automated Setup

The `user-data.sh` script:

1. Updates the server
2. Installs Nginx
3. Starts and enables Nginx
4. Deploys the website
5. Creates a health endpoint
6. Creates server troubleshooting scripts
7. Configures S3 backup automation

## Health Check

```bash
curl http://SERVER-IP/health/
