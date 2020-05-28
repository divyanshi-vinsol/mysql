--For taking backup of a database

mysqldump empcom > empcomDump.sql

--For restoring this backup

mysql empcom < empcomDump.sql