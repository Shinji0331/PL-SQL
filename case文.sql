DECLARE

   kensyu NUMBER(1) := 2;
BEGIN

    CASE kensyu
        WHEN 1 THEN
              dbms_output.put_line('1��I�����܂���');
        WHEN 2 THEN
              dbms_output.put_line('2��I�����܂���');
        WHEN 3 THEN
              dbms_output.put_line('3��I�����܂���');
        ELSE
              dbms_output.put_line('���l�������Ă��܂���');
    END CASE;

END;