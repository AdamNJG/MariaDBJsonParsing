call json_to_table('{"hello": "world", "goodbye": "world", "isDebug" : true, "config" : {"stuff": "things", "more stuff": "more things"}}');

SELECT * FROM configurations;

DELETE FROM configurations;