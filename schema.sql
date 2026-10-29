
-- 1. Create and select the database
CREATE DATABASE IF NOT EXISTS gqldemo;
USE gqldemo;

-- 2. Create the authors table
CREATE TABLE IF NOT EXISTS authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- 3. Create the books table
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    year INT,
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- 4. Insert sample authors only if they do not exist
INSERT INTO authors (name, country)
SELECT 'Asha Patel', 'India'
WHERE NOT EXISTS (
    SELECT 1 FROM authors
    WHERE name = 'Asha Patel' AND country = 'India'
);

INSERT INTO authors (name, country)
SELECT 'Ravi Kumar', 'India'
WHERE NOT EXISTS (
    SELECT 1 FROM authors
    WHERE name = 'Ravi Kumar' AND country = 'India'
);

-- 5. Insert sample books only if they do not exist
INSERT INTO books (title, year, author_id)
SELECT 'Databases 101', 2020, a.id
FROM authors a
WHERE a.name = 'Asha Patel'
  AND a.country = 'India'
  AND NOT EXISTS (
      SELECT 1 FROM books b
      WHERE b.title = 'Databases 101'
        AND b.year = 2020
        AND b.author_id = a.id
  );

INSERT INTO books (title, year, author_id)
SELECT 'SQL in Practice', 2022, a.id
FROM authors a
WHERE a.name = 'Asha Patel'
  AND a.country = 'India'
  AND NOT EXISTS (
      SELECT 1 FROM books b
      WHERE b.title = 'SQL in Practice'
        AND b.year = 2022
        AND b.author_id = a.id
  );

INSERT INTO books (title, year, author_id)
SELECT 'Web Services Basics', 2023, a.id
FROM authors a
WHERE a.name = 'Ravi Kumar'
  AND a.country = 'India'
  AND NOT EXISTS (
      SELECT 1 FROM books b
      WHERE b.title = 'Web Services Basics'
        AND b.year = 2023
        AND b.author_id = a.id
  );
