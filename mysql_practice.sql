MYSQL(いつかQiitaに投稿する用)

●MySQLモニタの起動--------------------------------------------------------
$ mysql -u ユーザ名 -p

$ mysql -u root -p
$ パスワードを入力する(root)

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.7.26 MySQL Community Server (GPL)
mysql>

これで起動完了


★データベースを作成する


●データベースを作成する--------------------------------------------------------

$ CREATE DATABASE データベース名;

$ CREATE DATABASE db1;

Query OK, 1 row affected (0.00 sec)


●データベースの確認--------------------------------------------------------

$ SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| db1                |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)


●使うデータベースを指定する--------------------------------------------------------

$ use データベース名

$ use db1
Database changed
※useはSQL文ではないので、「;」をつける必要はない

＊データベースを直接指定して、MySQLモニタを起動することができる。
$ mysql db1 -u root -p


●現在使用しているデータベースの表示--------------------------------------------------------

$ SELECT DATABASE();

+------------+
| DATABASE() |
+------------+
| db1        |
+------------+
1 row in set (0.00 sec)


●テーブルの作成-------------------------------------------------------------

$ CREATE TABLE テーブル名(カラム名1 データ型1, カラム名2 データ型2);

$ CREATE TABLE tb1(bang VARCHAR(10), nama VARCHAR(10), tosi INT);
Query OK, 0 rows affected (0.04 sec)


●全てのテーブルの表示-------------------------------------------------------

$ SHOW TABLES;

+---------------+
| Tables_in_db1 |
+---------------+
| db1           |
+---------------+
1 row in set (0.00 sec)


●useでデータベースを選択した状態で、他のデータベースにアクセスする----------------------------------------------------

$ SELECT * FROM db2.table;



●テーブルのカラム構造の確認-------------------------------------------------------

$ DESC テーブル名;

$ DESC tb1;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| bang  | varchar(10) | YES  |     | NULL    |       |
| nama  | varchar(10) | YES  |     | NULL    |       |
| tosi  | int(11)     | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

※Fieldがカラム名、Typeがデータ型


●テーブルにデータを挿入する------------------------------------------------------

$ INSERT INTO テーブル名 VALUES(データ1, データ2, データ3,.....);

$ INSERT INTO tb1 VALUES('A101', '佐藤', 40);
Query OK, 1 row affected (0.00 sec)

$ INSERT INTO tb1 VALUES('A102', '高橋', 28);
Query OK, 1 row affected (0.00 sec)


●カラムを指定してデータを挿入する------------------------------------------------------

$ INSERT INTO テーブル名 (カラム名1, カラム名2) VALUES(データ1, データ2);

$ INSERT INTO tb1 (tosi, nama, bang) VALUES(23, '渡辺', 'A104');
Query OK, 1 row affected (0.01 sec)

$ INSERT INTO tb1 (tosi, nama, bang) VALUES(35, '西沢', 'A105');
Query OK, 1 row affected (0.01 sec)


●一度にデータを挿入する------------------------------------------------------

$ INSERT INTO テーブル名 (カラム名1, カラム名2) VALUES(データ1, データ2), (データ1, データ2), (データ1, データ2);


●データを表示する------------------------------------------------------

$ SELECT カラム名1, カラム名2 FROM テーブル名;

$ SELECT bang, nama FROM tb1;

レコード全部表示させるときはこっち

$ SELECT * FROM tb1;

+------+--------+------+
| bang | nama   | tosi |
+------+--------+------+
| A101 | 佐藤   |   40 |
| A102 | 高橋   |   28 |
| A103 | 中川   |   20 |
| A104 | 渡辺   |   23 |
| A105 | 西沢   |   35 |
+------+--------+------+
5 rows in set (0.00 sec)




★テーブルのカラム構造の変更------------------------------------------------------

●カラムのデータ型を変更する------------------------------------------------------

$ ALTER TABLE テーブル名 MODIFY カラム名 データ型;

$ ALTER TABLE tb1C MODIFY nama VARCHAR(100);
Query OK, 5 rows affected (0.04 sec)
Records: 5  Duplicates: 0  Warnings: 0

$ DESC tb1C;

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| bang  | varchar(10)  | YES  |     | NULL    |       |
| nama  | varchar(100) | YES  |     | NULL    |       |
| tosi  | int(11)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)


●カラムを追加する------------------------------------------------------

$ ALTER TABLE テーブル名 ADD カラム名 データ型;

$ ALTER TABLE tb1C ADD umare DATETIME;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

$ DESC tb1C;

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| bang  | varchar(10)  | YES  |     | NULL    |       |
| nama  | varchar(100) | YES  |     | NULL    |       |
| tosi  | int(11)      | YES  |     | NULL    |       |
| umare | datetime     | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec


$ ALTER TABLE tb1C ADD umare DATETIME FIRST;
のように最後にFIRSTをつけると先頭に追加される。

$ ALTER TABLE tb1C ADD umare DATETIME AFTER bang;
のように書くと、bangの後に追加できる。


●カラム順の変更------------------------------------------------------

$ ALTER TABLE tb1C MODIFY umare DATETIME FIRST;

$ DESC tb1C;

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| umare | datetime     | YES  |     | NULL    |       |
| bang  | varchar(10)  | YES  |     | NULL    |       |
| nama  | varchar(100) | YES  |     | NULL    |       |
| tosi  | int(11)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)



●カラム名を含めてカラムのデータ型、位置を変更する------------------------------------------------------

$ ALTER TABLE テーブル名 CHANGE 変更前カラム名 変更後カラム名 変更後データ型;

$ ALTER TABLE tb1C CHANGE umare seinen DATE;
Query OK, 6 rows affected (0.03 sec)
Records: 6  Duplicates: 0  Warnings: 0

$ DESC tb1C;

+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| seinen | date         | YES  |     | NULL    |       |
| bang   | varchar(10)  | YES  |     | NULL    |       |
| nama   | varchar(100) | YES  |     | NULL    |       |
| tosi   | int(11)      | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)


●カラムを削除する------------------------------------------------------

$ ALTER TABLE テーブル名 DROP カラム名;

$ ALTER TABLE tb1C DROP seinen;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

$ DESC tb1C;

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| bang  | varchar(10)  | YES  |     | NULL    |       |
| nama  | varchar(100) | YES  |     | NULL    |       |
| tosi  | int(11)      | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)



★主キーを設定する------------------------------------------------------------------------------------------------------------


●主キーを設定してテーブルを作成する------------------------------------------------------

$ CREATE TABLE テーブル名 (カラム名 データ型 PRIMARY KEY);

$ CREATE TABLE itii(a INT PRIMARY KEY, b VARCHAR(10));
主キーであるINT型のカラム「a」と、VARCHAR型のカラム「b」を持つテーブルitiiを作成。

$ DESC itii;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| a     | int(11)     | NO   | PRI | NULL    |       |
| b     | varchar(10) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)


●一意キーの設定------------------------------------------------------

$ CREATE TABLE uniq(a INT UNIQUE, b VARCHAR(10));

$ DESC uniq;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| a     | int(11)     | YES  | UNI | NULL    |       |
| b     | varchar(10) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

※主キーとの違いは、一意キーはNULLでもOK!!!!
何も入れないのは許されるが、重複はダメということ。


●AUTO_INCREMENT------------------------------------------------------

$ CREATE TABLE renzoku (a INT AUTO_INCREMENT PRIMARY KEY, b VARCHAR(10));

$ DESC renzoku;

+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| a     | int(11)     | NO   | PRI | NULL    | auto_increment |
| b     | varchar(10) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

※自動的の連続番号を生成する昨日の設定方法は、RDBMSによって異なる。
 MySQLではカラムに「AUTO_INCREMENT」を定義することで連続番号を実現。


●AUTO_INCREMENTの値を初期化する------------------------------------------------------

$ ALTER TABLE テーブル名 AUTO_INCREMENT=1;


●DEFAULT値の設定------------------------------------------------------

$ CREATE TABLE テーブル名 (カラム名 データ型 DEFAULT 初期値);

#変更の場合はALTER
$ ALTER TABLE tb1G MODIFY nama VARCHAR(10) DEFAULT '氏名未入力';

$ DESC tb1G;

+-------+-------------+------+-----+-----------------+-------+
| Field | Type        | Null | Key | Default         | Extra |
+-------+-------------+------+-----+-----------------+-------+
| bang  | varchar(10) | YES  |     | NULL            |       |
| nama  | varchar(10) | YES  |     | 氏名未入力      |       |
| tosi  | int(11)     | YES  |     | NULL            |       |
+-------+-------------+------+-----+-----------------+-------+
3 rows in set (0.00 sec)



★インデックスの設定--------------------------------------------------------------------------------------------------------

●インデックスの設定----------------------------------------------------------

$ CREATE INDEX インデックス名 ON テーブル名(カラム名);

$ CREATE INDEX my_ind ON tb1G(bang);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0


●インデックスの表示----------------------------------------------------------

$ SHOW INDEX FROM テーブル名;

+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| tb1g  |          1 | my_ind   |            1 | bang        | A         |           5 |     NULL | NULL   | YES  | BTREE      |         |               |
+-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
1 row in set (0.00 sec)

$ SHOW INDEX FROM tb1G;
※最後の「;」を「\G」に変えると見やすくなる。

*************************** 1. row ***************************
        Table: tb1g
   Non_unique: 1
     Key_name: my_ind
 Seq_in_index: 1
  Column_name: bang
    Collation: A
  Cardinality: 5
     Sub_part: NULL
       Packed: NULL
         Null: YES
   Index_type: BTREE
      Comment:
Index_comment:
1 row in set (0.00 sec)


●インデックスの削除----------------------------------------------------------

$ DROP INDEX インデックス名 ON テーブル名;

$ DROP INDEX my_ind ON tb1G;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0








MySQLの特徴------------------------------------------------------------------------------------------------------------------------------------------------------------------
●VARCHAR(10)と指定しているのに10文字以上のデータを入力した場合、エラーにならず10文字を超えるデータは勝手に削除される。

●自動的の連続番号を生成する昨日の設定方法は、RDBMSによって異なる。
 MySQLではカラムに「AUTO_INCREMENT」を定義することで連続番号を実現。