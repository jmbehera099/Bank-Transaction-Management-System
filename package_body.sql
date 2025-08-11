-- package_body.sql
CREATE OR REPLACE PACKAGE BODY bank_pkg AS

    PROCEDURE open_account(p_customer_id NUMBER, p_initial_deposit NUMBER) IS
    BEGIN
        INSERT INTO accounts VALUES (seq_account.NEXTVAL, p_customer_id, p_initial_deposit);
    END open_account;

    PROCEDURE delete_account(p_account_no NUMBER) IS
    BEGIN
        DELETE FROM accounts WHERE account_no = p_account_no;
    END delete_account;

    PROCEDURE deposit(p_account_no NUMBER, p_amount NUMBER) IS
    BEGIN
        UPDATE accounts SET balance = balance + p_amount WHERE account_no = p_account_no;
        INSERT INTO transactions VALUES (seq_txn.NEXTVAL, p_account_no, 'DEPOSIT', p_amount, SYSDATE);
    END deposit;

    PROCEDURE withdraw(p_account_no NUMBER, p_amount NUMBER) IS
    BEGIN
        UPDATE accounts SET balance = balance - p_amount WHERE account_no = p_account_no;
        INSERT INTO transactions VALUES (seq_txn.NEXTVAL, p_account_no, 'WITHDRAW', p_amount, SYSDATE);
    END withdraw;

    PROCEDURE transfer_money(p_from_acc NUMBER, p_to_acc NUMBER, p_amount NUMBER) IS
    BEGIN
        UPDATE accounts SET balance = balance - p_amount WHERE account_no = p_from_acc;
        UPDATE accounts SET balance = balance + p_amount WHERE account_no = p_to_acc;
        INSERT INTO transactions VALUES (seq_txn.NEXTVAL, p_from_acc, 'TRANSFER_OUT', p_amount, SYSDATE);
        INSERT INTO transactions VALUES (seq_txn.NEXTVAL, p_to_acc, 'TRANSFER_IN', p_amount, SYSDATE);
    END transfer_money;

    PROCEDURE mini_statement(p_account_no NUMBER) IS
    BEGIN
        FOR rec IN (SELECT * FROM transactions WHERE account_no = p_account_no ORDER BY txn_date DESC FETCH FIRST 5 ROWS ONLY) LOOP
            DBMS_OUTPUT.PUT_LINE('Txn ID: ' || rec.txn_id || ', Type: ' || rec.txn_type || ', Amount: ' || rec.amount || ', Date: ' || rec.txn_date);
        END LOOP;
    END mini_statement;

END bank_pkg;
