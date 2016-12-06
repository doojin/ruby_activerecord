CREATE TABLE location_description (
  id INT(10) NOT NULL AUTO_INCREMENT,
  description CHAR(255) NOT NULL,
  PRIMARY KEY (id)
) CHARACTER SET utf8;

CREATE TABLE location (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name CHAR(255) NOT NULL,
  parent_location_fk INT(10) NOT NULL,
  locaiton_description_fk INT(10) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (parent_location_fk) REFERENCES location (id),
  FOREIGN KEY (locaiton_description_fk) REFERENCES location_description (id)
) CHARACTER SET utf8;