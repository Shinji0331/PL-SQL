FUNCTION CONVERT_DATE(
    before_convert_date   IN VARCHAR2                    --�ϊ�������t
    convert_mode_num      IN NUMBER                      --�ϊ����[�h�u�P�v�FYYYYMMDD��GYYMMDD  �u�Q�v�FGYYMMDD��YYYYMMDD
)RETURN VARCHAR2
IS

    after_convert_date    VARCHAR2(8)   := NULL;         --�߂�l(�ϊ���̓��t���i�[)
    
BEGIN
    --�p�����[�^�����t�ł��邩����
    --���t�łȂ����Exception�ւƂ΂�
    before_convert_date := TO_DATE(before_convert_date,'YYYYMMDD');

    --�ϊ����[�h�u�P�vYYYYMMDD �� GYYMMDD
    IF convert_mode_num = 1 THEN
    
         --�V�����̏ꍇ
         IF before_convert_date >= 20190501 THEN
         
              --�a��99�N�ȏ�łȂ����Ƃ𔻒�
              IF (LPAD(TO_CAHR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 2019 + 1),3,'0') > 99 ) THEN
              
                   RETURN NULL;
                   
              ELSE
              
                   --�����ԍ���ǉ�
                   after_convert_date := '5';
                   --�N��ǉ����
                   after_convert_date := after_convert_date || LPAD(TO_CAHR(TO_NUMBER(SUBSTR(before_convert_date,1,4)) - 2019 + 1),2,'0');
                   --������ǉ����
                   after_convert_date := after_convert_date || SUBSTR(before_convert_date,5,4);
              
              END IF;
         
         END IF;
    
    END IF;

