-- triggers.sql
CREATE OR REPLACE TRIGGER trg_account_log
AFTER INSERT OR DELETE ON accounts
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO account_log VALUES (seq_log.NEXTVAL, :NEW.account_no, 'OPEN', SYSDATE);
    ELSIF DELETING THEN
        INSERT INTO account_log VALUES (seq_log.NEXTVAL, :OLD.account_no, 'DELETE', SYSDATE);
    END IF;
END;
