DELIMITER //
CREATE OR REPLACE procedure json_to_table ( value longtext )

BEGIN

   IF JSON_VALID(value) THEN
	  call insert_json(value);
   ELSE
      SIGNAL SQLSTATE '45000' 
      SET MYSQL_ERRNO=333, 
      MESSAGE_TEXT='Invalid JSON object';
   END IF;

END; //

DELIMITER ;