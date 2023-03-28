DELIMITER //
CREATE OR REPLACE procedure insert_json ( value longtext )

BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE _keys varchar(255) DEFAULT JSON_KEYS(value);
	DECLARE _current_key varchar(255) DEFAULT '';
	DECLARE _current_value longtext DEFAULT '';

	WHILE i < JSON_LENGTH(_keys) DO
		SELECT JSON_UNQUOTE(JSON_EXTRACT(_keys, CONCAT('$[',i, ']'))) INTO _current_key;
	    SELECT JSON_UNQUOTE(JSON_EXTRACT(value, CONCAT('$.', _current_key))) INTO _current_value;
	   
		INSERT INTO configurations VALUES(_current_key, _current_value);
		SET i = i + 1;
	END WHILE;

END; //

DELIMITER ;