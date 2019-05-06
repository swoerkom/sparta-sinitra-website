DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS films;

CREATE TABLE genre (
  genreid SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE books (
  bookid SERIAL PRIMARY KEY,
  author VARCHAR(255),
  bookname VARCHAR(255),
  genreid int REFERENCES genre(genreid)
);

CREATE TABLE films (
  filmid SERIAL PRIMARY KEY,
  director VARCHAR(255),
  filmname VARCHAR(255),
  genreid int REFERENCES genre(genreid)
);

INSERT INTO genre (name) VALUES ('Horror');
INSERT INTO genre (name) VALUES ('Action');
INSERT INTO genre (name) VALUES ('Sci-Fi');
INSERT INTO genre (name) VALUES ('Thriller');
INSERT INTO books (author, bookname, genreid) VALUES ('JK Rowling', 'Harry Potter 1', 1);
INSERT INTO books (author, bookname, genreid) VALUES ('JK Rowling', 'Harry Potter 2', 1);
INSERT INTO books (author, bookname, genreid) VALUES ('JK Rowling', 'Harry Potter 3', 1);
INSERT INTO books (author, bookname, genreid) VALUES ('JK Rowling', 'Harry Potter 4', 1);
INSERT INTO films (director, filmname, genreid) VALUES ('A Russo', 'Avengers 1', 2);
INSERT INTO films (director, filmname, genreid) VALUES ('A Russo', 'Avengers 2', 2);
INSERT INTO films (director, filmname, genreid) VALUES ('A Russo', 'Avengers 3', 2);
INSERT INTO films (director, filmname, genreid) VALUES ('A Russo', 'Avengers 4', 2);
