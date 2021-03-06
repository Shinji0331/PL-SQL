
create or replace FUNCTION ADD_MONTH_DATE(
    fetch_date_GYYMMDD   IN VARCHAR2,                      --加算する日付
    add_month_num        IN NUMBER                         --加算月数
)RETURN VARCHAR2
IS

    after_add_month_date    VARCHAR2(7)   := NULL;         --戻り値(加算後の日付を格納)
    fetch_date_YYYYMMDD  VARCHAR2(8)      := NULL;         --西暦変換用変数

BEGIN

    --西暦に変換
    fetch_date_YYYYMMDD := CONVERT_DATE(fetch_date_GYYMMDD,2);
    
    --月数を加算
    fetch_date_YYYYMMDD := TO_CHAR(ADD_MONTHS(TO_DATE(fetch_date_YYYYMMDD,'YYYYMMDD'),add_month_num),'YYYYMMDD');
    
    --和暦へ変換
    after_add_month_date := CONVERT_DATE(fetch_date_YYYYMMDD,1);
    
    RETURN after_add_month_date;
    
EXCEPTION

    WHEN OTHERS THEN
    RETURN 'error!!  -年月加算ができません-';

END ADD_MONTH_DATE;
