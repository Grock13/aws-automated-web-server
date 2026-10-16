# Deployment Test

A new EC2 instance was launched using the User Data bootstrap script.

The server automatically:

- installed Nginx
- started Nginx
- deployed the website
- created the health endpoint
- attached AWS permissions through an IAM role
- accessed S3

No manual application configuration was required after launch.

## Validation

```bash
curl http://SERVER-IP
curl http://SERVER-IP/health/

