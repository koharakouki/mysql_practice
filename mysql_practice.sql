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

$ CREATE TABLE db1(bang VARCHAR(10), nama VARCHAR(10), tosi INT);
Query OK, 0 rows affected (0.04 sec)


●全てのテーブルの表示-------------------------------------------------------

$ SHOW TABLES;

+---------------+
| Tables_in_db1 |
+---------------+
| db1           |
+---------------+
1 row in set (0.00 sec)




