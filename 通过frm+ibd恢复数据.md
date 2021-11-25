一、获取表结构(如果有表结构可以跳过1-16步骤)
1、本地创建与目标表一样的表名例:abc
字段只需要建一个id
2、备份好新表的abc.frm文件
3、修改mysql.ini配置，在[mysqld]里添加innodb_force_recovery=6
4、复制旧frm文件覆盖abc.frm
5、重启mysql
6、输入查看表结构语句show CREATE TABLE abc，会提示表不存在
这个时候就去找到错误日志文件，[Warning] InnoDB: Table ww/gonggao contains 1 user defined columns in InnoDB, but 4 columns in MySQL.
这是因为字段数量不对等报错是因为，我们要恢复的表有4个字段，而我们在创建表的时候只创建了1个字段

7、把刚才备份好的新表abc.frm再重新放回原来位置
8、修改mysql.ini配置，把innodb_force_recovery=6删掉，重启mysql
9、把abc表的字段增加至4个，字段名和字段类型随便
10、(重复3步骤)修改mysql.ini配置，在[mysqld]里添加innodb_force_recovery=6
11、(重复4步骤)复制旧frm文件覆盖abc.frm
12、重启mysql
13、输入查看表结构语句show CREATE TABLE abc（这个时候就能得到旧表的完整创建语句，复制到文本，等会用）
14、(重复7步骤)把刚才备份好的新表abc.frm再重新放回原来位置
15、(重复8步骤)修改mysql.ini配置，把innodb_force_recovery=6删掉，重启mysql
16、删掉abc数据表，把刚才复制的旧表创建语句，重新创建abc表


如果已经知道表结构，可以直接创建新表，然后从下面步骤开始恢复

17、执行语句：alter table abc discard tablespace;(清掉abc表空间数据)
18、把旧表abc.ibd复制到和abc.frm同等目录
19、运行：alter table abc import tablespace;(绑定空间数据)
20、完成