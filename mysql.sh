DB_USER='pccu'
DB_PASSWD='SYMCdemo123!'
DB_NAME='pccu'
DB_HOST='mysql.iamdemo.broadcom.com'

#    TRUNCATE TABLE evaluateRiskResponse;
mysql -h $DB_HOST --user=$DB_USER --password=$DB_PASSWD $DB_NAME
