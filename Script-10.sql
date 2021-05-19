-- Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы.
USE vk;
CREATE INDEX user_message ON messages(from_user_id, id);
CREATE UNIQUE INDEX user_email ON users(email);
CREATE INDEX age ON profiles (birthday);

-- Задание на оконные функции
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы
-- среднее количество пользователей в группах (сумма количестива пользователей во всех группах делённая на количество групп)
-- самый молодой пользователь в группе (желательно вывести имя и фамилию)
-- самый старший пользователь в группе (желательно вывести имя и фамилию)
-- количество пользователей в группе
-- всего пользователей в системе (количество пользователей в таблице users)
-- отношение в процентах для последних двух значений (общее количество пользователей в группе / всего пользователей в системе) * 100

USE vk;
SELECT * FROM communities;
SELECT * FROM communities_users;
SELECT * FROM users u JOIN profiles p ON u.id = p.user_id WHERE u.last_name = 'Jerde';

SELECT DISTINCT
c.name, 
count(cu.user_id) OVER () / max(cu.community_id) OVER () AS avg_user_group,
FIRST_VALUE (p.birthday) OVER by_name AS oldest,
FIRST_VALUE (concat(u.first_name, ' ', u.last_name)) OVER by_name AS oldest,
LAST_VALUE  (p.birthday) OVER (PARTITION BY c.name) AS youngest,
LAST_VALUE (concat(u.first_name, ' ', u.last_name)) OVER (PARTITION BY c.name) AS oldest,
-- так как у меня во всех группах по 10 юзеров то я взял сумму, а не колличество id чтобы цифры по группам отличались
sum(u.id) OVER (PARTITION BY c.name) AS sum_id_group,
sum(u.id) OVER () AS sum_id_all, 
round(sum(u.id) OVER (PARTITION BY c.name)/sum(u.id) OVER () * 100, 2) AS '%'
	FROM communities_users cu LEFT JOIN users u ON cu.user_id = u.id LEFT JOIN communities c ON c.id = cu.community_id LEFT JOIN profiles p ON p.user_id = u.id
		WINDOW by_name AS (PARTITION BY c.name ORDER BY p.birthday);
	
SELECT count(*) FROM communities c GROUP BY name;