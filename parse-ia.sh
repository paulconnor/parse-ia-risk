#!/bin/bash

 
echo -n " Processing."

#
export HEADER=true
export BASEFILE=$1
export OUTPUT=`echo "${BASEFILE%.*}.out"`
rm -f $OUTPUT
echo -n "Parsing raw data."

perl ./parse-ia.pl $1 > $OUTPUT

echo ""

echo "Uploading processed data to MySQL"

DB_USER='pccu'
export MYSQL_PWD='SYMCdemo123!'
DB_NAME='pccu'
DB_HOST='mysql.iamdemo.broadcom.com'

#    TRUNCATE TABLE evaluateRiskResponse;
#mysql -h $DB_HOST --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
#delete from riskResponse;
mysql -h $DB_HOST --user=$DB_USER $DB_NAME << EOF
load data local infile '${OUTPUT}' into table riskResponse fields terminated by ',' lines terminated by '\n';
EOF

echo "Evaluate Risk Response data successfully processed"
