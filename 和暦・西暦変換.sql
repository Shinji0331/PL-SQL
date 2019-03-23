FUNCTION CONVERT_DATE(
    before_convert_date   IN VARCHAR2                    --変換する日付
    convert_mode_num      IN NUMBER                      --変換モード「１」：YYYYMMDD→GYYMMDD  「２」：GYYMMDD→YYYYMMDD
)RETURN VARCHAR2
IS

    after_convert_date    VARCHAR2(8)   := NULL;         --戻り値(変換後の日付を格納)
    
BEGIN
    --パラメータが日付であるか判定
    --日付でなければExceptionへとばす
    before_convert_date := TO_DATE(before_convert_date,'YYYYMMDD');

    --変換モード「１」YYYYMMDD → GYYMMDD
    IF convert_mode_num = 1 THEN
    
         --新元号の場合
         IF before_convert_date >= 20190501 THEN
         
              --和暦99年以上でないことを判定
              IF (LPAD(TO_CAHR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 2019 + 1),3,'0') > 99 ) THEN
              
                   RETURN NULL;
                   
              ELSE
              
                   --元号番号を追加
                   after_convert_date := '5';
                   --年を追加代入
                   after_convert_date := after_convert_date || LPAD(TO_CAHR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 2019 + 1),2,'0');
                   --月日を追加代入
                   after_convert_date := after_convert_date || SUBSTR(before_convert_date,5,4);
              
              END IF;
         
         END IF;
    
    END IF;

