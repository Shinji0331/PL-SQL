create or replace FUNCTION CONVERT_DATE(
    before_convert_date   IN VARCHAR2,                    --�ϊ�������t
    convert_mode_num      IN NUMBER                      --�ϊ����[�h�u�P�v�FYYYYMMDD��GYYMMDD  �u�Q�v�FGYYMMDD��YYYYMMDD
)RETURN VARCHAR2
IS

    after_convert_date    VARCHAR2(8)   := NULL;         --�߂�l(�ϊ���̓��t���i�[)

BEGIN

    --�ϊ����[�h�u�P�vYYYYMMDD �� GYYMMDD
    IF convert_mode_num = 1 THEN

         --�p�����[�^�����t�ł��邩����
         --���t�łȂ����Exception�ւƂ΂�
         after_convert_date := TO_DATE(before_convert_date,'YYYYMMDD');

         --�V�����̏ꍇ
         IF before_convert_date >= 20190501 THEN

              --�a��99�N�ȏ�łȂ����Ƃ𔻒�
              IF (LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 2019 + 1),3,'0') > 99 ) THEN

                   RETURN NULL;

              ELSE

                   --�����ԍ���ǉ�
                   after_convert_date := '5';
                   --�N��ǉ����
                   after_convert_date := after_convert_date || LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 2019 + 1),2,'0');
                   --������ǉ����
                   after_convert_date := after_convert_date || SUBSTR(before_convert_date,5,4);

              END IF;

         --�����̏ꍇ     
         ELSIF before_convert_date >= 19890108 THEN

              --�����ԍ���ǉ�
              after_convert_date := '4';
              --�N��ǉ����
              after_convert_date := after_convert_date || LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 1989 + 1),2,'0');
              --������ǉ����
              after_convert_date := after_convert_date || SUBSTR(before_convert_date,5,4);

         ELSE

              RETURN NULL;

         END IF;

    END IF;

    --�ϊ����[�h�u�Q�vGYYMMDD �� YYYYMMDD
    IF convert_mode_num = 2 THEN

         --�V�����̏ꍇ
         IF SUBSTR(before_convert_date,1,1) = '5' THEN

              --�N����
              after_convert_date := LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,2,2)) + 2019 - 1),4,'0');
              --������ǉ����
              after_convert_date := after_convert_date || SUBSTR(before_convert_date,4,4);

         --�����̏ꍇ
         ELSIF SUBSTR(before_convert_date,1,1) = '4' THEN

              --�N����
              after_convert_date := LPAD(TO_CHAR(TO_NUMBER(SUBSTR(before_convert_date,2,2)) + 1989 - 1),4,'0');
              --������ǉ����
              after_convert_date := after_convert_date || SUBSTR(before_convert_date,4,4);

         ELSE

              RETURN NULL;

         END IF;

         --�߂�l�����t���ǂ������肷��
         --���t�łȂ����Exception�ւƂ΂�
         after_convert_date := TO_DATE(after_convert_date,'YYYYMMDD');

    END IF;

    --�߂�l�̕ԋp
    RETURN after_convert_date;

EXCEPTION

    WHEN OTHERS THEN
    RETURN 'error!!  -�a��E����ϊ����ł��܂���-';

END CONVERT_DATE;