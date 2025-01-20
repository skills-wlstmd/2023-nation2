SELECT * FROM "wsi-database"."accesslog" limit 10;

SELECT year, month, day, hour, minute, path, responsecode as statuscode, COUNT(*) as count FROM "wsi-database"."accesslog" GROUP BY year, month, day, hour, minute, path, responsecode