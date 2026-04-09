CREATE TABLE pet_care_log (
    product_id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    log_text    VARCHAR2(500),
    log_datetime  TIMESTAMP      DEFAULT SYSTIMESTAMP,
    updated_by_user  VARCHAR2(100)  DEFAULT USER
)

CREATE OR REPLACE TRIGGER trg_product_set_updated_by
BEFORE INSERT ON pet_care_log
FOR EACH ROW
BEGIN
    :NEW.updated_by_user:=USER;
    :NEW.log_datetime:=SYSTIMESTAMP;
END;

CREATE OR REPLACE TRIGGER trg_same_user_updated_by
BEFORE UPDATE ON pet_care_log
FOR EACH ROW
BEGIN
    IF :OLD.updated_by_user != NULL AND :OLD.updated_by_user != :NEW.updated_by_user THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'updated_by_user must be the same user'
        );
    END IF;
END;

CREATE OR REPLACE TRIGGER trg_deleted_by_manager
BEFORE DELETE ON pet_care_log
FOR EACH ROW
BEGIN
    IF USER != 'JOEMANAGER' THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'only manager can delete a record'
        );
    END IF;
END;