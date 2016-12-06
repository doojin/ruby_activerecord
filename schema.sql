CREATE TABLE location_metadata (
  id INT(10) NOT NULL AUTO_INCREMENT,
  description CHAR(255) NOT NULL,
  PRIMARY KEY (id)
) CHARACTER SET utf8;

CREATE TABLE location (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name CHAR(255) NOT NULL,
  parent_location_fk INT(10) NULL,
  metadata_fk INT(10) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (parent_location_fk) REFERENCES location (id) ON DELETE CASCADE,
  FOREIGN KEY (metadata_fk) REFERENCES location_metadata (id) ON DELETE CASCADE
) CHARACTER SET utf8;

INSERT INTO location_metadata VALUES (NULL, 'Location 1 Description');

INSERT INTO location VALUES
  (1, 'Location 1', NULL, 1),
  (2, 'Location 2', 1, NULL),
  (3, 'Location 3', 1, NULL)