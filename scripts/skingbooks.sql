USE stephenkingbooks;

DROP TABLE IF EXISTS stephenkingbooks;
CREATE TABLE `stephenkingbooks`
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

LOAD DATA INFILE './unprocessed_sking.csv'
INTO TABLE `stephenkingbooks`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(`original_title`, `spanish_title`, @`genre`, @`pages`, @`year`)
SET `year` = LEFT(@`year`, 4), `pages` = @`pages`;
