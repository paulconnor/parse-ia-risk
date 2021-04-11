DB_USER='<xxx>'
DB_PASSWD='<yyy>'
DB_NAME='<db>'
DB_HOST='<URL>'

#    TRUNCATE TABLE evaluateRiskResponse;
mysql -h $DB_HOST --user=$DB_USER --password=$DB_PASSWD $DB_NAME
