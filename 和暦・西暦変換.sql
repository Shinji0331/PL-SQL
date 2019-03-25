create or replace FUNCTION CONVERT_DATE(
    before_convert_date   IN VARCHAR2,                    --変換する日付
    convert_mode_num      IN NUMBER                      --変換モード「１」：YYYYMMDD→GYYMMDD  「２」：GYYMMDD→YYYYMMDD
)RETURN VARCHAR2
IS

    after_convert_date    VARCHAR2(8)   := NULL;         --戻り値(変換後の日付を格納)

BEGIN

    --変換モード「１」YYYYMMDD → GYYMMDD
    IF convert_mode_num = 1 THEN

         --パラメータが日付であるか判定
         --日付でなければExceptionへとばす
         after_convert_date := TO_DATE(before_convert_date,'YYYYMMDD');

         --新元号の場合
         IF before_convert_date >= 20190501 THEN

              --和暦99年以上でないことを判定
              IF (LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 2019 + 1),3,'0') > 99 ) THEN

                   RETURN NULL;

              ELSE

                   --元号番号を追加
                   after_convert_date := '5';
                   --年を追加代入
                   after_convert_date := after_convert_date || LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 2019 + 1),2,'0');
                   --月日を追加代入
                   after_convert_date := after_convert_date || SUBSTR(before_convert_date,5,4);

              END IF;

         --平成の場合     
         ELSIF before_convert_date >= 19890108 THEN

              --元号番号を追加
              after_convert_date := '4';
              --年を追加代入
              after_convert_date := after_convert_date || LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 1989 + 1),2,'0');
              --月日を追加代入
              after_convert_date := after_convert_date || SUBSTR(before_convert_date,5,4);

         ELSE

              RETURN NULL;

         END IF;

    END IF;

    --変換モード「２」GYYMMDD → YYYYMMDD
    IF convert_mode_num = 2 THEN

         --新元号の場合
         IF SUBSTR(before_convert_date,1,1) = '5' THEN

              --年を代入
              after_convert_date := LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,2,2)) + 2019 - 1),4,'0');
              --月日を追加代入
              after_convert_date := after_convert_date || SUBSTR(before_convert_date,4,4);

         --平成の場合
         ELSIF SUBSTR(before_convert_date,1,1) = '4' THEN

              --年を代入
              after_convert_date := LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,2,2)) + 1989 - 1),4,'0');
              --月日を追加代入
              after_convert_date := after_convert_date || SUBSTR(before_convert_date,4,4);

         ELSE

              RETURN NULL;

         END IF;

         --戻り値が日付かどうか判定する
         --日付でなければExceptionへとばす
         after_convert_date := TO_DATE(after_convert_date,'YYYYMMDD');

    END IF;

    --戻り値の返却
    RETURN after_convert_date;

EXCEPTION

    WHEN OTHERS THEN
    RETURN 'error!!  -和暦・西暦変換ができません-';

END CONVERT_DATE;