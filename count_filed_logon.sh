cat /var/log/auth.log.1 | grep 'Failed password' | grep sshd | awk '{print $1,$2}'|sort|uniq -c
