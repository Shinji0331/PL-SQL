CREATE OR REPLACE PACKAGE SEQ_NEXTVAL_PACK IS

     FUNCTION SEQ_NEXTVAL(
          seq_name IN VARCHAR2
     )RETURN NUMBER;

END SEQ_NEXTVAL_PACK;
/
show errors;

create or replace PACKAGE BODY SEQ_NEXTVAL_PACK IS

     FUNCTION SEQ_NEXTVAL(
          seq_name IN VARCHAR2
     )RETURN NUMBER
     IS

          v_nb_nextval  NUMBER := NULL;

     BEGIN

          EXECUTE IMMEDIATE 'SELECT ' || seq_name || '.NEXTVAL FROM DUAL' INTO v_nb_nextval;
          RETURN v_nb_nextval;

     EXCEPTION
          WHEN OTHERS THEN
          RETURN 0;


     END SEQ_NEXTVAL;


END SEQ_NEXTVAL_PACK;
