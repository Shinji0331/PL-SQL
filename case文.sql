DECLARE

   kensyu NUMBER(1) := 2;
BEGIN

    CASE kensyu
        WHEN 1 THEN
              dbms_output.put_line('1を選択しました');
        WHEN 2 THEN
              dbms_output.put_line('2を選択しました');
        WHEN 3 THEN
              dbms_output.put_line('3を選択しました');
        ELSE
              dbms_output.put_line('数値が入っていません');
    END CASE;

END;