-- 大数据分页-查询优化

-- 例,当分页达到后面页码时，查询时间增加（优化前-查询时间约3-5秒）
select * from `log` where `uid`=100 order by id desc limit 100000,10; 

-- 优化,利用主键索引和连接查询INNER JOIN(优化后-查询时间约0.3秒)
select * from `log` t1
INNER JOIN
(select id from `log` where `uid`=100 order by id desc limit 100000,10) as t2
where t1.id=t2.id;