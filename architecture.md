# Architecture

```text
                        Internet
                           |
                           v
                  +----------------+
                  | Security Group |
                  +----------------+
                    |            |
                 SSH :22      HTTP :80
                    |            |
                    +------v-----+
                           |
                    +-------------+
                    | EC2         |
                    | Amazon Linux|
                    +-------------+
                           |
                    EC2 User Data
                           |
             +-------------+-------------+
             |             |             |
           Nginx        Website        Scripts
             |                           |
         /health/                    S3 Backup
                                         |
                                     IAM Role
                                         |
                                         v
                                   +------------+
                                   | Amazon S3  |
                                   +------------+
