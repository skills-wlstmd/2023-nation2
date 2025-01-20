CREATE EXTERNAL TABLE IF NOT EXISTS `wsi-database`.`accesslog` (
  `clientip` string, 
  `method` string, 
  `path` string, 
  `protocol` string, 
  `responsecode` int,
  `processingtime` double, 
  `useragent` string, 
  `year` int,
  `month` int, 
  `day` int, 
  `hour` int, 
  `minute` int, 
  `second` int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION 's3://wsi-logs-wlst/accesslog/'
TBLPROPERTIES ('classification' = 'parquet');