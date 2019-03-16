CREATE INDEX lname_fname ON User (Last_name, First_name);

CREATE UNIQUE INDEX mail_adress ON User (E_mail);

CREATE INDEX phone_number ON User (Phone_number);

CREATE UNIQUE INDEX prod_title ON Product (Product_title);

CREATE INDEX keyword ON Keyword(Word);