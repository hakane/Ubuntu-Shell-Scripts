#!/bin/bash
_now=$(date +"%Y_%m_%d_%H_%M")
_file="dbname_$_now.sql"

cd /root/backup/mysql

_day_of_month=$(date +"%d")
if [ "$_day_of_month" = "01" ]; then
        _now=$(date +"%Y_%m")
        _file="dbname_$_now.sql"
else
        _now=$(date +"%u")
        _file="dbname_$_now.sql"
fi

mysqldump -u backup_user -p'password' dbname > "$_file"
gzip -f -9 "$_file"

echo "MySQL backup" | mutt backup@example.com -s "MySQL Backup $_now" -a "$_file".gz
