#!/bin/bash

 
export OUTPUT=$1

echo "Uploading processed data to MySQL"

DB_USER='pccu'
export MYSQL_PWD='SYMCdemo123!'
DB_NAME='pccu'
DB_HOST='mysql.iamdemo.broadcom.com'

mysql -h $DB_HOST --user=$DB_USER $DB_NAME << EOF
load data local infile '${OUTPUT}' into table riskResponse fields terminated by ',' lines terminated by '\n';
EOF

echo "Evaluate Risk Response data successfully processed"
