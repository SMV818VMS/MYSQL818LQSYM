USE stephenkingbooks;

DROP TABLE IF EXISTS stephenkingbooks;
CREATE TABLE stephenkingbooks
(
  `id`              int unsigned NOT NULL auto_increment,
  `original_title`  varchar(255) NOT NULL,
  `spanish_title`   varchar(255) NOT NULL,
  `year`            decimal(4) NOT NULL,
  `pages`           decimal(10) NOT NULL,
  `in_collection`   enum('Y','N') NOT NULL DEFAULT 'N',
  `read`            enum('Y','N') NOT NULL DEFAULT 'N',

  PRIMARY KEY     (id)
);

LOAD DATA LOCAL INFILE '../files/unprocessed_sking.csv' INTO TABLE stephenkingbooks
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
(@col1, @col2, @col3, @col4) SET `original_title`=@col1, `spanish_title`=@col2, `year`=@col4, `pages`=@col3
IGNORE 1 ROWS;
