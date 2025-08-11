-- package_spec.sql
CREATE OR REPLACE PACKAGE bank_pkg AS
    PROCEDURE open_account(p_customer_id NUMBER, p_initial_deposit NUMBER);
    PROCEDURE delete_account(p_account_no NUMBER);
    PROCEDURE deposit(p_account_no NUMBER, p_amount NUMBER);
    PROCEDURE withdraw(p_account_no NUMBER, p_amount NUMBER);
    PROCEDURE transfer_money(p_from_acc NUMBER, p_to_acc NUMBER, p_amount NUMBER);
    PROCEDURE mini_statement(p_account_no NUMBER);
END bank_pkg;
