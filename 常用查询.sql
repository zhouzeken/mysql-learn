-- 多表查询，获取关联表的全部数据,用英文逗号隔开
select t1.*,GROUP_CONCAT(distinct(t2.xx)) as xx FROM table1 as t1 INNER JOIN table2 as t2 where 1=1;

-- 查询重复数量大于2的
SELECT id,unionid,COUNT(*) as count FROM gl_user where product_id=236 GROUP BY unionid HAVING count > 1;