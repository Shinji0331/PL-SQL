--*************************************************************************
--パッケージを作成にあたる構文
--FUNCTION,PROCEDUREを中に記載して使用
--*************************************************************************


create or replace
PACKAGE パッケージ名 Is

FUNCTION ファンクション名(
変数A IN VARCHAR2
)RETURN VARCHAR2;

END パッケージ名;
/
show errors;

create or replace
PACKAGE BODY パッケージ名 IS

FUNCTION ファンクション名(
変数A IN VARCHAR2
)RETURN VARCHAR2
IS

宣言部分

BEGIN

--テスト用なのでパラメータを直接返すだけの設定
RETURN 変数A

EXCEPTION

     WHEN OTHERS THEN
     RETURN NULL;

END ファンクション名

END パッケージ名;
/
errors;


