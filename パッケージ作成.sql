--*************************************************************************
--�p�b�P�[�W���쐬�ɂ�����\��
--FUNCTION,PROCEDURE�𒆂ɋL�ڂ��Ďg�p
--*************************************************************************


create or replace
PACKAGE �p�b�P�[�W�� Is

FUNCTION �t�@���N�V������(
�ϐ�A IN VARCHAR2
)RETURN VARCHAR2;

END �p�b�P�[�W��;
/
show errors;

create or replace
PACKAGE BODY �p�b�P�[�W�� IS

FUNCTION �t�@���N�V������(
�ϐ�A IN VARCHAR2
)RETURN VARCHAR2
IS

�錾����

BEGIN

--�e�X�g�p�Ȃ̂Ńp�����[�^�𒼐ڕԂ������̐ݒ�
RETURN �ϐ�A

EXCEPTION

     WHEN OTHERS THEN
     RETURN NULL;

END �t�@���N�V������

END �p�b�P�[�W��;
/
errors;


