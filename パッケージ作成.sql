--*************************************************************************
--パッケージを作成にあたる構文
--FUNCTION,PROCEDUREを中に記載して使用
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

    --宣言部分

    BEGIN

    --テスト用なのでパラメータを直接返すだけの設定
        RETURN hensu_A;

    EXCEPTION

        WHEN OTHERS THEN
             RETURN NULL;

    END FUN_A;

END samplepac;
/
errors;