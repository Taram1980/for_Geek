USE vk;
-- 
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT p.gender, count(p.user_id) AS n_counts FROM profiles p JOIN likes l ON p.user_id = l.user_id GROUP BY p.gender ORDER BY n_counts DESC LIMIT 1;


-- 
-- Вывести для каждого пользователя количество созданных сообщений, постов, загруженных медиафайлов и поставленных лайков.
-- 1
SELECT n_users.id, n_messages.n_messages, n_posts.n_posts, n_media.n_media, n_likes.n_likes  
FROM 
(SELECT id  FROM users) AS n_users
LEFT JOIN 
(SELECT from_user_id, count(from_user_id) AS n_messages FROM messages GROUP BY from_user_id) AS n_messages
ON n_users.id = n_messages.from_user_id
LEFT JOIN 
(SELECT user_id, count(user_id) AS n_posts FROM posts GROUP BY user_id) AS n_posts
ON n_users.id = n_posts.user_id
LEFT JOIN 
(SELECT user_id, count(user_id) AS n_media FROM media GROUP BY user_id) AS n_media
ON n_users.id = n_media.user_id
LEFT JOIN 
(SELECT user_id, count(user_id) AS n_likes FROM likes l GROUP BY user_id) AS n_likes
ON n_users.id = n_likes.user_id
ORDER BY id
;
-- 2
SELECT users.id, count(DISTINCT messages.id) AS count_message, count(DISTINCT posts.id) AS count_posts, count(DISTINCT media.user_id) AS count_media, count(DISTINCT likes.user_id) AS count_likes
FROM 
users
LEFT JOIN
messages
ON users.id = messages.from_user_id
LEFT JOIN
posts
ON users.id = posts.user_id
LEFT JOIN
media
ON users.id = media.user_id
LEFT JOIN
likes
ON users.id = likes.user_id
GROUP BY users.id;


SELECT * FROM likes l WHERE l.target_type = 'users' AND l.target_id = 39;

-- 5. (по желанию) Подсчитать количество лайков которые получили
-- 10 самых молодых пользователей. 

SELECT * FROM profiles p ;

SELECT sum(result_) 
FROM 
(SELECT (count(likes_users.user_id)) AS result_
FROM 
profiles p 
LEFT JOIN
(SELECT * FROM likes l WHERE l.target_type = 'users') AS likes_users
ON p.user_id = likes_users.target_id
GROUP BY p.user_id
ORDER BY birthday DESC
LIMIT 10) AS youngest_likes
;
