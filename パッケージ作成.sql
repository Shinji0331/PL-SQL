--*************************************************************************
--�p�b�P�[�W���쐬�ɂ�����\��
--FUNCTION,PROCEDURE�𒆂ɋL�ڂ��Ďg�p
--***************/*********************************************************
create or replace
PACKAGE samplepac IS

    FUNCTION FUN_A(
         hensu_A IN VARCHAR2
    )RETURN VARCHAR2;

    END samplepac;
/
show errors;

create or replace
PACKAGE BODY samplepac IS

    FUNCTION FUN_A(
         hensu_A IN VARCHAR2
    )RETURN VARCHAR2
    IS

    --�錾����

    BEGIN

    --�e�X�g�p�Ȃ̂Ńp�����[�^�𒼐ڕԂ������̐ݒ�
        RETURN hensu_A;

    EXCEPTION

        WHEN OTHERS THEN
             RETURN NULL;

    END FUN_A;

END samplepac;
/
errors;