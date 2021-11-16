一、本地mysql数据库创建与备份库一致的数据库名，如testdb；

二、本地创建与备份库一致的数据库表，记得设置ALTER TABLE tableName1 ROW_FORMAT = compact;

三、停止mysql服务，在数据库的配置文件my.conf或my-default.ini中添加innodb_force_recovery=1 后再启动mysql服务；

四、将表结构和空间脱离

打开DOS命令窗口，依次执行以下命令：
cd C:\Program Files\MySQL\MySQL Server 5.7\bin\

mysql -hlocalhost -uroot -p123456

mysql > use testdb;

mysql > alter table tableName1 discard tablespace;

五、用winRAR解压类似“hins6413187_data_20190925065809”文件

六、在解压的数据库名文件夹下找到并复制tableName1.ibd到tableName1.frm同目录下

七、将表结构和空间建立关系

mysql > alter table tableName1 import tablespace;

搞定！