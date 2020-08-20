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







