drop table if exists book;
drop table if exists author;

CREATE TABLE Author (
    id INTEGER(4) PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(256),
    last_name VARCHAR(256),
    email VARCHAR(256),
    phone VARCHAR(15),
    website VARCHAR(50),
    date_created TIMESTAMP(4),
    date_updated TIMESTAMP(4),
    UNIQUE KEY unique_idx (email , phone)
);

CREATE TABLE Book (
    id INTEGER(4) PRIMARY KEY AUTO_INCREMENT,
    author_id INTEGER(4),
    title VARCHAR(256),
    subtitle VARCHAR(256),
    description VARCHAR(2000),
    ISBN CHAR(15),
    price DECIMAL(9,2),
    date_created TIMESTAMP(4),
    date_updated TIMESTAMP(4),
    CONSTRAINT book_author_idx FOREIGN KEY (author_id)
        REFERENCES Author (id),
    UNIQUE KEY (ISBN)
);

ALTER TABLE BOOK ADD Column ASIN VARCHAR(10);
ALTER TABLE BOOK ADD Column UPC Decimal(12);
ALTER TABLE BOOK ADD Column EAN Decimal(13);