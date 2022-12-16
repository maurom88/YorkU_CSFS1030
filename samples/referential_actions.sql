--
-- INITIAL SETUP --
--

DROP TABLE IF EXISTS your_table;
DROP TABLE IF EXISTS my_table;

CREATE TABLE my_table(
   my_num INT NOT NULL,
   my_id CHAR(1) PRIMARY KEY
);

INSERT INTO my_table
	VALUES (1, 'a'), (2, 'b'), (3, 'c');
SELECT * FROM my_table;

--
-- WITHOUT REFERENTIAL ACTIONS --
--

CREATE TABLE your_table(
   your_id INT,
   my_id CHAR(1),
   PRIMARY KEY (your_id),
   CONSTRAINT fk_your_table_my_id
      FOREIGN KEY (my_id)
      REFERENCES my_table(my_id)
);

INSERT INTO your_table
	VALUES (10, 'a'), (20, 'b'), (30, 'a');

DELETE FROM my_table WHERE my_id = 'a';

--
-- WITH REFERENTIAL ACTIONS --
--

DROP TABLE IF EXISTS your_table;

CREATE TABLE your_table(
   your_id INT,
   my_id CHAR(1),
   PRIMARY KEY (your_id),
   CONSTRAINT fk_your_table_my_id
      FOREIGN KEY (my_id)
      REFERENCES my_table(my_id)
      ON UPDATE CASCADE
      ON DELETE SET NULL
);

INSERT INTO your_table
	VALUES (10, 'a'), (20, 'b'), (30, 'a');

DELETE FROM my_table WHERE my_id = 'a';

SELECT * FROM my_table;
SELECT * FROM your_table;
