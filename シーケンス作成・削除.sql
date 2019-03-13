--シーケンス作成
create sequence seq01      --シーケンス名
     increment by 1        --増幅値
     start with 10         --開始値
     maxvalue 20           --最大値
     cycle                 --cycle/nocycle 繰り返すかどうか
     nocache;               --cache/nocache メモリ上の確保値
     
--シーケンス削除
drop sequence seq01;
     
     