-- insert_data.sql
INSERT INTO customers VALUES (seq_customer.NEXTVAL, 'John Doe', TO_DATE('1990-05-12','YYYY-MM-DD'), 'USA');
INSERT INTO customers VALUES (seq_customer.NEXTVAL, 'राम कुमार', TO_DATE('1985-08-20','YYYY-MM-DD'), 'Delhi');
INSERT INTO customers VALUES (seq_customer.NEXTVAL, 'सीता वर्मा', TO_DATE('1992-11-15','YYYY-MM-DD'), 'Mumbai');

INSERT INTO accounts VALUES (seq_account.NEXTVAL, 1, 5000);
INSERT INTO accounts VALUES (seq_account.NEXTVAL, 2, 10000);
INSERT INTO accounts VALUES (seq_account.NEXTVAL, 3, 7000);
