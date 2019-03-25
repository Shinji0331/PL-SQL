
create or replace FUNCTION ADD_MONTH_DATE(
    fetch_date_GYYMMDD   IN VARCHAR2,                      --���Z������t
    add_month_num        IN NUMBER                         --���Z����
)RETURN VARCHAR2
IS

    after_add_month_date    VARCHAR2(7)   := NULL;         --�߂�l(���Z��̓��t���i�[)
    fetch_date_YYYYMMDD  VARCHAR2(8)      := NULL;         --����ϊ��p�ϐ�

BEGIN

    --����ɕϊ�
    fetch_date_YYYYMMDD := CONVERT_DATE(fetch_date_GYYMMDD,2);
    
    --���������Z
    fetch_date_YYYYMMDD := TO_CHAR(ADD_MONTHS(TO_DATE(fetch_date_YYYYMMDD,'YYYYMMDD'),add_month_num),'YYYYMMDD');
    
    --�a��֕ϊ�
    after_add_month_date := CONVERT_DATE(fetch_date_YYYYMMDD,1);
    
    RETURN after_add_month_date;
    
EXCEPTION

    WHEN OTHERS THEN
    RETURN 'error!!  -�N�����Z���ł��܂���-';

END ADD_MONTH_DATE;
