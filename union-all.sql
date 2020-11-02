 -- 使用union all 代替or 查询
 
 --案例
 SELECT * FROM gl_z_test where id=133  or id=134 or uid=147 ORDER BY id desc LIMIT 10;
 
 --改为
 SELECT * FROM 
(
(select * FROM gl_z_test where id="133")
UNION ALL
(SELECT * FROM gl_z_test where id="134")
UNION ALL
(SELECT * FROM gl_z_test where uid=147)
) as t1 ORDER BY t1.id desc LIMIT 10
;