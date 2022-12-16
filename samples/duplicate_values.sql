DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO contacts (first_name,last_name,email) 
VALUES ('Carine ','Schmitt','carine.schmitt@verizon.net'),
       ('Jean','King','jean.king@me.com'),
       ('Peter','Ferguson','peter.ferguson@google.com'),
       ('Janine ','Labrune','janine.labrune@aol.com'),
       ('Jonas ','Bergulfsen','jonas.bergulfsen@mac.com'),
       ('Janine ','Labrune','janine.labrune@aol.com'),
       ('Susan','Nelson','susan.nelson@comcast.net'),
       ('Zbyszek ','Piestrzeniewicz','zbyszek.piestrzeniewicz@att.net'),
       ('Roland','Keitel','roland.keitel@yahoo.com'),
       ('Julie','Murphy','julie.murphy@yahoo.com'),
       ('Kwai','Lee','kwai.lee@google.com'),
       ('Jean','King','jean.king@me.com'),
       ('Susan','Nelson','susan.nelson@comcast.net'),
       ('Roland','Keitel','roland.keitel@yahoo.com');

SELECT * FROM contacts
	ORDER BY email;

-- Find one duplicate field
SELECT 
    email, 
    COUNT(email)
FROM
    contacts
GROUP BY email
HAVING COUNT(email) > 1;

-- Find multiple duplicate fields
SELECT 
    first_name, COUNT(first_name),
    last_name,  COUNT(last_name),
    email,      COUNT(email)
FROM
    contacts
GROUP BY 
    first_name , 
    last_name , 
    email
HAVING  COUNT(first_name) > 1
    AND COUNT(last_name) > 1
    AND COUNT(email) > 1;

-- Count how many rows there are with the same values
SELECT 
    *, 
    ROW_NUMBER() OVER ( 
        PARTITION BY first_name, last_name, email
        ORDER BY id, first_name, last_name
        ) AS rn
FROM contacts;

-- Delete duplicate rows (starting from the query above)
WITH ct AS (
SELECT 
    *, 
    ROW_NUMBER() OVER ( 
        PARTITION BY first_name, last_name, email
        ORDER BY first_name, last_name
        ) AS rn
FROM contacts
)
DELETE FROM contacts WHERE id IN (SELECT id FROM ct WHERE rn > 1);
