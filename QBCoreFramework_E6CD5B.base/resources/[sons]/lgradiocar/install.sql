
CREATE TABLE IF NOT EXISTS radiocar_owned (
  id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE radiocar_owned
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
