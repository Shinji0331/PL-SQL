
create or replace FUNCTION ADD_MONTH_DATE(
    fetch_date_GYYMMDD   IN VARCHAR2,                      --‰ÁZ‚·‚é“ú•t
    add_month_num        IN NUMBER                         --‰ÁZŒ”
)RETURN VARCHAR2
IS

    after_add_month_date    VARCHAR2(7)   := NULL;         --–ß‚è’l(‰ÁZŒã‚Ì“ú•t‚ğŠi”[)
    fetch_date_YYYYMMDD  VARCHAR2(8)      := NULL;         --¼—ï•ÏŠ·—p•Ï”

BEGIN

    --¼—ï‚É•ÏŠ·
    fetch_date_YYYYMMDD := CONVERT_DATE(fetch_date_GYYMMDD,2);
    
    --Œ”‚ğ‰ÁZ
    fetch_date_YYYYMMDD := TO_CHAR(ADD_MONTHS(TO_DATE(fetch_date_YYYYMMDD,'YYYYMMDD'),add_month_num),'YYYYMMDD');
    
    --˜a—ï‚Ö•ÏŠ·
    after_add_month_date := CONVERT_DATE(fetch_date_YYYYMMDD,1);
    
    RETURN after_add_month_date;
    
EXCEPTION

    WHEN OTHERS THEN
    RETURN 'error!!  -”NŒ‰ÁZ‚ª‚Å‚«‚Ü‚¹‚ñ-';

END ADD_MONTH_DATE;
