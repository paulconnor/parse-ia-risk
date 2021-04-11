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

DB_USER='db'
export MYSQL_PWD='password'
DB_NAME='db'
DB_HOST='host'

#    TRUNCATE TABLE evaluateRiskResponse;
#mysql -h $DB_HOST --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
#delete from riskResponse;
mysql -h $DB_HOST --user=$DB_USER $DB_NAME << EOF
load data local infile '${OUTPUT}' into table riskResponse fields terminated by ',' lines terminated by '\n';
EOF

echo "Evaluate Risk Response data successfully processed"
