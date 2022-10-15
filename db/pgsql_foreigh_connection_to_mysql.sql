CREATE EXTENSION IF NOT EXISTS mysql_fdw;

CREATE SERVER IF NOT EXISTS mysql_server
	FOREIGN DATA WRAPPER mysql_fdw
	OPTIONS (host '<host>', port '<port>');

CREATE USER MAPPING FOR postgres
	SERVER mysql_server
	OPTIONS (username '<username>', password '<password>');

CREATE FOREIGN TABLE IF NOT EXISTS leads_mysql
	(
		first_name text,
		last_name text
	)
	SERVER mysql_server
	OPTIONS (dbname '<db_name>', table_name '<table_name>');