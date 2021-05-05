-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”
-- Работаем с БД vk и тестовыми данными, которые вы сгенерировали ранее:
-- 
-- Создать и заполнить таблицы лайков и постов.

USE vk;
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type ENUM('messages', 'users', 'posts', 'media') NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM likes;

DROP TABLE IF EXISTS target_types;
CREATE TEMPORARY TABLE target_types (
  name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');

INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    (SELECT name FROM target_types ORDER BY RAND() LIMIT 1),
    CURRENT_TIMESTAMP 
  FROM messages;
 
SELECT * FROM likes l ;


 -- Создадим таблицу постов
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- вставка
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (1, 6, 5, 'voluptatem', 'Aspernatur et magnam ipsam explicabo. In dolorem est dignissimos voluptatum exercitationem eius at. Quidem voluptate totam beatae est amet aut. Dolores praesentium aut est qui unde.', 3, 1, 0, '2010-02-28 07:47:54', '1989-05-06 20:08:07');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (2, 8, 1, 'id', 'Qui id eligendi laborum cumque et doloremque. Repellat laborum nesciunt quis qui repudiandae est. Assumenda possimus officia aperiam delectus minima sit excepturi.', 0, 1, 1, '1974-07-15 11:43:24', '1989-06-15 12:09:13');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (3, 3, 2, 'quos', 'Ut nulla nihil enim molestias necessitatibus. Velit ipsam aliquam hic nam illum mollitia est praesentium. Nam qui omnis ab quis est.', 0, 0, 1, '1991-05-07 03:25:29', '2013-05-06 14:33:41');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (4, 7, 7, 'asperiores', 'Porro quidem quam in. Omnis omnis vel aliquid iste ducimus cumque eos. Esse neque ad consectetur minima inventore. Aperiam dolor ipsam quaerat assumenda dolores ipsa.', 3, 0, 1, '2004-11-11 16:38:46', '2006-03-05 10:05:25');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (5, 2, 4, 'eos', 'Aut eos eos debitis. Nisi et accusantium est molestiae et qui dicta. Tenetur qui a similique nihil. Nam iusto quisquam ut non fuga aut.', 1, 1, 0, '2017-09-09 00:30:30', '1991-05-15 13:29:48');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (6, 6, 4, 'accusantium', 'Nesciunt earum reprehenderit a enim fugiat quisquam quidem. Eligendi molestiae qui officia error consequatur ex libero.', 3, 1, 0, '1983-10-30 23:18:50', '1970-06-22 08:08:30');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (7, 1, 0, 'alias', 'Est earum doloremque et dolor dolore saepe accusamus sunt. Laborum magni voluptatum enim eos.', 6, 1, 0, '2005-09-09 10:24:15', '2016-12-04 22:19:58');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (8, 0, 7, 'cupiditate', 'Ullam odit et voluptas natus. Voluptatem enim vitae vel aspernatur numquam esse. Deserunt aut qui eos enim corporis voluptatem et similique. At similique labore laudantium animi.', 3, 0, 0, '2016-03-19 14:09:00', '1970-07-16 02:27:17');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (9, 5, 5, 'est', 'Quis voluptatum fuga veniam ipsa vitae. Quos aut provident quasi perspiciatis quo laborum vel alias.', 2, 0, 1, '2018-03-29 18:07:09', '2014-07-04 12:38:25');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (10, 2, 7, 'error', 'Sit animi doloribus qui. Minus voluptatibus soluta quis accusantium animi et impedit. Et et eligendi accusamus recusandae aliquam enim ducimus id. Ducimus necessitatibus exercitationem modi eum.', 6, 1, 0, '2006-05-16 22:18:49', '2001-04-13 03:50:30');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (11, 3, 3, 'est', 'Earum qui voluptas esse quis. Explicabo et voluptatem magnam voluptas tempore nobis. Sed ea est facilis. Nostrum consequatur reiciendis est sint explicabo.', 1, 1, 0, '2019-04-29 06:31:50', '1993-08-15 23:32:55');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (12, 1, 3, 'sunt', 'Doloribus sed quo expedita blanditiis sunt. Et in facere ex adipisci eveniet et dolorum. Ut velit quibusdam aliquam impedit quod illo asperiores. Laborum quo consequatur id et consequuntur eos.', 1, 1, 1, '2019-11-25 09:52:38', '1991-03-07 20:10:05');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (13, 4, 1, 'dolore', 'Praesentium nisi odio et omnis. Quia vero quasi quasi nemo repellendus explicabo hic molestiae. Commodi nulla vel odio optio vero tenetur.', 2, 1, 0, '1974-02-01 10:49:23', '1972-11-13 15:13:06');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (14, 0, 3, 'debitis', 'Eius iste dolore distinctio veritatis. Sapiente eligendi aut voluptatem saepe non et culpa. Deserunt eligendi deleniti qui est.', 3, 0, 1, '2011-11-11 21:47:49', '1979-03-30 14:39:12');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (15, 8, 5, 'deleniti', 'Consequatur hic et quas officiis fugit ullam sunt. In modi enim qui aut. Voluptates architecto porro commodi eveniet modi iusto. Dolorem sint voluptates amet sed repudiandae voluptas in.', 7, 1, 1, '2018-10-17 15:54:45', '1975-07-27 09:56:02');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (16, 5, 9, 'sint', 'Praesentium consequatur quo qui et. Qui quas qui natus corporis quis. Ab sint autem nihil ut omnis. Modi fugit praesentium veniam magni.', 4, 0, 1, '2018-05-10 09:33:49', '1991-05-10 04:19:34');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (17, 8, 4, 'commodi', 'Voluptatum quisquam non doloremque et ullam est. Non laboriosam sunt dolor quis optio molestias omnis perferendis. Delectus rerum voluptatibus recusandae suscipit eos aut vitae omnis.', 3, 1, 0, '1973-03-17 05:39:48', '1999-10-11 13:34:49');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (18, 6, 2, 'deleniti', 'At vitae ullam provident. Id deserunt esse cumque repellendus natus optio tempore quos.', 2, 0, 1, '1994-02-20 09:38:06', '2016-04-27 19:50:27');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (19, 4, 1, 'doloremque', 'Ea minus exercitationem soluta repellat asperiores. Repellendus incidunt nihil iusto magnam non. In voluptates libero autem impedit accusamus. Voluptatem quia qui fuga voluptas distinctio.', 3, 1, 1, '1992-07-26 15:02:03', '2005-09-28 00:33:49');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (20, 1, 4, 'officia', 'Consequatur maiores blanditiis nisi ipsam deserunt ea. Deleniti sed similique vel vel.', 3, 0, 1, '1990-08-18 22:52:48', '2001-06-09 04:03:22');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (21, 5, 5, 'corrupti', 'Repudiandae pariatur saepe ut in. Impedit dolores corporis sint. Perspiciatis expedita asperiores magnam magni labore possimus natus illo. Minus aut quae est rem eum voluptatem eum.', 0, 0, 0, '2014-06-27 08:29:09', '1978-07-11 20:16:44');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (22, 0, 1, 'recusandae', 'Dignissimos voluptatem quasi sit saepe impedit corporis et voluptatem. Id odio deleniti sint labore et nemo et. Ducimus et aut sapiente ut aliquid.', 1, 0, 1, '1999-03-01 21:23:21', '1980-11-19 23:20:50');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (23, 2, 6, 'quia', 'Magni delectus debitis facilis molestiae accusamus dolorem. Laudantium officiis omnis exercitationem autem reprehenderit rerum. Nihil aperiam doloribus rerum consequatur. Deserunt ullam a enim necessitatibus et.', 2, 1, 0, '2008-05-10 09:28:52', '2011-12-28 06:31:31');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (24, 0, 1, 'explicabo', 'Ut labore ut consequatur eos voluptatum temporibus eaque. Praesentium id necessitatibus nesciunt dolorum sapiente ut odit.', 7, 1, 1, '1985-11-08 21:05:49', '2001-05-11 03:26:32');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (25, 8, 0, 'sunt', 'Laborum ipsam atque consequatur nam. Consequatur ut cumque nostrum itaque inventore et consequuntur. Voluptas quae inventore doloremque veniam nihil. A accusamus non sit provident et.', 4, 0, 0, '2010-07-18 16:21:12', '2014-04-08 18:04:58');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (26, 5, 7, 'aut', 'Maiores quos consectetur id asperiores. Beatae quibusdam itaque quia temporibus. Autem nulla vel quia laborum.', 6, 0, 0, '1996-02-06 09:49:31', '2009-03-01 07:18:53');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (27, 4, 3, 'natus', 'Aspernatur suscipit non eligendi nihil nihil non esse. Est pariatur deleniti nihil eius ea.', 7, 1, 0, '1981-04-07 16:07:56', '1983-11-06 11:33:41');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (28, 2, 3, 'omnis', 'Quo voluptatibus porro et hic consequuntur at velit quas. Voluptatem mollitia quos non labore assumenda deserunt dolores. Quo quasi numquam suscipit dolorem perspiciatis.', 5, 1, 1, '1976-12-13 12:14:22', '1993-09-13 06:56:34');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (29, 4, 8, 'quia', 'Ratione accusamus et consequuntur ipsum et est praesentium. Aut aspernatur nisi id ipsum assumenda. Dolores iusto magnam impedit dolore iure.', 4, 1, 1, '1976-11-15 10:26:10', '1999-02-09 12:04:16');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (30, 7, 6, 'eveniet', 'Cupiditate ex voluptatem sed recusandae modi recusandae. Vitae expedita sit sint ut voluptatem ut.', 7, 0, 0, '1974-03-23 04:35:53', '2000-08-16 04:25:59');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (31, 7, 3, 'sed', 'Sint occaecati ratione aliquam illum adipisci repellat. Rerum maxime incidunt facere rerum rerum quibusdam.', 4, 1, 0, '2018-01-09 23:52:36', '1998-04-21 17:27:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (32, 0, 3, 'sed', 'Quis dolores velit odio explicabo aliquid. Officia ea id quia rerum. Doloribus nemo non ab unde omnis. Excepturi consequatur tempora commodi laudantium commodi voluptatem.', 4, 0, 1, '1976-01-20 12:12:14', '1993-12-14 18:02:45');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (33, 1, 1, 'vero', 'Consequatur magnam at enim qui facilis eveniet odit. Nihil delectus similique ipsum iusto non. Aut sed et autem in provident quis reprehenderit. Odio est quae eum commodi reiciendis repellendus voluptatum.', 5, 1, 0, '2016-09-09 13:37:11', '2001-07-05 14:14:46');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (34, 2, 1, 'est', 'Quos optio quis suscipit. Fugit corporis aspernatur minus officiis nihil.', 6, 1, 0, '1972-01-12 03:38:16', '1977-09-10 08:37:21');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (35, 0, 3, 'ea', 'Voluptate rerum asperiores et molestiae impedit. Necessitatibus et nobis odit culpa. Dicta nam molestias dignissimos voluptates sapiente et.', 3, 0, 1, '2001-07-15 16:02:14', '2018-08-22 11:19:17');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (36, 7, 4, 'suscipit', 'Autem aut autem consequuntur laborum rem dolore ut. Id mollitia hic veritatis nesciunt. Aut inventore nobis odit. Quo occaecati sapiente officia.', 7, 0, 1, '1986-05-14 10:26:27', '1992-04-03 22:57:03');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (37, 8, 5, 'nobis', 'Aspernatur est sed ut expedita occaecati quia distinctio. Repellendus facere doloribus qui et saepe explicabo nemo nam. Repudiandae non sequi tempora voluptatem enim. Doloremque illum similique est laudantium vel voluptatem.', 4, 0, 0, '2017-10-08 11:12:49', '1988-06-30 01:40:53');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (38, 5, 5, 'vel', 'Omnis voluptatem facilis earum facere ullam odit. Qui ut aut et ducimus perferendis doloribus. Nulla et enim natus aliquid eligendi voluptas est.', 2, 1, 1, '1992-12-17 11:17:13', '2019-01-22 13:59:48');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (39, 4, 4, 'unde', 'Magni atque reiciendis illum consectetur. Voluptas consequatur libero amet modi. Non earum voluptas adipisci.', 3, 1, 1, '2010-08-12 16:40:14', '1988-11-21 13:52:04');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (40, 9, 7, 'omnis', 'Reprehenderit animi excepturi consequuntur omnis voluptatem esse aut. Enim ut voluptate fugit laboriosam blanditiis id eius.', 9, 1, 0, '1987-11-12 21:19:30', '2003-08-19 08:58:25');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (41, 8, 2, 'harum', 'Porro earum vel voluptatem delectus ut iste aliquam. Itaque ea amet quisquam temporibus totam qui at sit. Ab aut voluptas distinctio dolor et.', 0, 1, 0, '2009-02-05 10:29:47', '2013-01-16 04:00:28');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (42, 1, 8, 'a', 'Perferendis est sit praesentium sit. Et nemo repellendus facere iste et. Sit et qui nulla quo culpa ut praesentium. At deleniti eligendi dolor aliquid vel.', 0, 1, 0, '1991-08-15 07:35:32', '1991-12-10 23:15:00');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (43, 7, 6, 'blanditiis', 'Enim qui non doloribus quibusdam officiis numquam in. Quis vero est in adipisci sed. Omnis non omnis sed ab sint officia temporibus.', 3, 0, 1, '1976-09-24 07:04:32', '1993-10-26 02:21:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (44, 2, 2, 'a', 'Non necessitatibus fuga omnis dolor recusandae accusantium. Tempore reiciendis id illo quis. Cum fugit velit quibusdam omnis fugiat debitis sit.', 6, 1, 1, '2001-08-01 22:24:37', '2004-10-25 07:52:08');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (45, 3, 6, 'soluta', 'Non suscipit cupiditate nam perferendis facilis. Ad quisquam ad dolores. Accusantium est repellat architecto velit et perspiciatis nam. Eum aut aut tempora.', 1, 1, 1, '2007-01-23 19:46:37', '2012-05-12 15:18:21');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (46, 5, 0, 'omnis', 'Voluptas exercitationem sapiente ut sit sed est ut. Qui facilis nisi libero sapiente. Distinctio non et et deserunt non. Consectetur molestiae sint alias quaerat voluptatem voluptas itaque.', 5, 0, 0, '1999-11-28 23:55:33', '2006-07-17 10:24:37');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (47, 6, 6, 'accusantium', 'Molestiae sed quam explicabo. Facilis sit tempore beatae nobis debitis quibusdam facere. Tenetur harum commodi odit rem nostrum est. Rerum qui repudiandae fugiat possimus fugiat.', 2, 0, 0, '1971-08-12 17:43:54', '2015-10-23 21:31:35');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (48, 6, 6, 'adipisci', 'Deserunt nemo optio omnis cumque repudiandae. Asperiores accusantium molestias quia porro aut eveniet. Ut eum qui soluta molestias.', 8, 0, 1, '1981-04-20 09:24:49', '2014-04-10 22:16:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (49, 7, 2, 'qui', 'Saepe reiciendis reprehenderit officia quia ab dolorem. Rem dolore dolores placeat dolores et. Nihil odio sed est nihil aspernatur et perferendis. Velit et esse qui dolorum et molestias veniam.', 6, 1, 0, '1998-08-03 09:03:07', '2007-09-24 13:41:31');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (50, 9, 6, 'quo', 'Molestiae at placeat maxime voluptate. Rem neque ut et qui. Ducimus est est fuga. Corporis cupiditate ipsam optio amet est ipsa.', 2, 1, 1, '1985-08-24 20:02:13', '1996-12-04 08:05:41');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (51, 4, 9, 'nobis', 'Ut enim nihil minima in voluptate vel necessitatibus. Eligendi qui enim consequuntur et est ut. Minus repudiandae doloremque est nam qui magni dolorem. Corporis tempore sint expedita molestiae omnis et.', 7, 1, 0, '2001-03-08 18:38:46', '1988-02-21 17:32:24');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (52, 2, 0, 'ab', 'Inventore impedit repellat libero unde dolorum nemo sit. Aspernatur iste sunt minus. Sit earum voluptatum officiis non et non dolores.', 7, 0, 1, '2009-04-05 08:21:38', '2006-06-22 01:21:48');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (53, 1, 0, 'ex', 'Expedita dolor tempora aperiam quae magnam recusandae et ut. Ut distinctio magni facilis fugiat consequatur. Aut et porro ipsum ullam.', 8, 0, 0, '1998-09-13 16:34:46', '1990-05-27 22:22:37');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (54, 4, 8, 'provident', 'Non aperiam nesciunt quis id ut officia. Tempora quo nostrum reprehenderit laboriosam. Quia veritatis explicabo nihil accusantium.', 3, 1, 0, '1980-12-30 11:46:57', '2016-12-26 08:19:50');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (55, 4, 8, 'ab', 'Facilis cumque numquam facere. Earum asperiores temporibus hic quis maiores sint soluta. Ut delectus reprehenderit sit dolorem consequuntur sit laborum.', 8, 0, 0, '2004-04-29 01:14:02', '1986-07-17 12:30:20');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (56, 6, 6, 'ipsum', 'Culpa in rerum fuga quia ut sed officiis. Consequatur rem architecto debitis. Aperiam aut ipsam sit corrupti.', 7, 1, 1, '1978-08-17 05:22:50', '2018-05-14 05:31:57');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (57, 6, 4, 'eum', 'Ducimus est esse labore dolor vel consequuntur. Est rem odit voluptate suscipit quisquam alias. Tempora minima voluptates inventore doloribus.', 9, 0, 0, '2008-12-04 04:48:21', '2009-11-13 07:47:31');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (58, 2, 2, 'eius', 'Atque voluptatibus quo saepe aliquam magnam. Sapiente quam quidem eius enim consequatur doloribus. Possimus suscipit rem cum ut hic harum. Autem ea libero excepturi et ea distinctio fugit molestias. Sint quos tempora recusandae id molestias at.', 0, 0, 0, '2014-07-18 11:02:27', '2003-09-07 03:11:39');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (59, 4, 7, 'officia', 'Aut iste necessitatibus praesentium sint possimus quaerat. Et aperiam doloremque nobis distinctio deserunt sequi nisi. Quia quibusdam cupiditate eligendi ea blanditiis explicabo.', 9, 0, 0, '2014-05-21 22:24:46', '1979-09-14 02:55:46');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (60, 4, 4, 'vitae', 'Provident sequi qui nam deserunt sapiente. Ut qui neque voluptas sequi ut nisi omnis ducimus. Recusandae ad nemo et et dicta et. Enim neque quidem consequatur saepe sapiente assumenda.', 7, 0, 1, '1996-01-30 03:56:56', '1975-01-01 20:51:24');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (61, 3, 8, 'quia', 'Assumenda voluptatem non consequuntur atque sed. Nesciunt nobis exercitationem ex accusantium ut et. Quam porro consequatur nihil voluptatem nemo.', 4, 1, 0, '1976-11-18 17:30:17', '2020-01-18 04:39:07');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (62, 2, 6, 'aut', 'Accusamus quis natus qui ex dolore dolor distinctio. Ullam officia sed vel fuga quia sapiente ut. Nihil non aut veniam illo laboriosam quis laudantium. Ut natus velit rerum.', 0, 0, 1, '1992-06-16 19:12:11', '1976-01-09 22:51:08');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (63, 0, 2, 'quia', 'Ea occaecati dolor non est numquam voluptate facilis. Cum voluptatem ea fugit. Eos placeat eos assumenda ea quasi nisi non et. Doloribus et ratione vero ipsam qui.', 9, 1, 0, '1981-02-13 10:49:44', '2004-08-08 23:02:50');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (64, 7, 9, 'voluptate', 'Qui ab facilis quo hic asperiores qui iste. Deserunt sunt harum ex libero voluptatem. Sit voluptas in fugit veritatis fugit reprehenderit quos.', 4, 0, 1, '2016-12-26 03:31:37', '1983-11-07 00:03:43');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (65, 6, 1, 'laudantium', 'Commodi nihil architecto explicabo dolor. Beatae quia cum aut sit. Rem alias sunt ut maxime accusamus sunt dolor maiores. Architecto itaque autem consequuntur voluptatem vero.', 4, 0, 1, '1986-10-18 00:21:39', '2014-02-12 15:27:27');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (66, 3, 8, 'quia', 'Ut est ipsa cumque temporibus error accusantium accusantium consequatur. Quaerat blanditiis natus quisquam quia corrupti ullam et.', 3, 1, 1, '2002-06-24 16:51:01', '1977-02-02 08:15:18');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (67, 4, 1, 'modi', 'Placeat ducimus enim ut consequatur totam et. Ea nobis quia maxime aliquam molestiae non. Voluptatem sit id rerum adipisci architecto autem alias.', 7, 0, 1, '1983-05-26 06:07:14', '2005-05-17 18:43:44');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (68, 9, 7, 'error', 'Quia maiores molestias deleniti id. Nam ea qui iure itaque debitis perspiciatis fugiat fugiat. Modi repellat nihil asperiores ut. Molestias suscipit ea dolorem dolorem.', 8, 1, 1, '1982-09-06 11:03:06', '1978-12-18 21:50:00');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (69, 8, 4, 'perferendis', 'Nostrum autem repellendus occaecati ea qui neque quia. Illo et dolore odio numquam dolores. Ut tempora ab quasi dolor amet et aut. Voluptatum et facilis id sapiente aut quo.', 6, 0, 0, '1992-12-11 07:25:44', '1995-04-12 00:33:20');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (70, 0, 1, 'est', 'Laborum laboriosam veniam quas ut. Quisquam officiis et optio animi ipsa rerum. Et natus voluptatem recusandae minus consequuntur.', 5, 1, 0, '2013-04-26 02:16:08', '2004-08-14 18:50:17');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (71, 8, 0, 'eius', 'Non voluptatem nam occaecati ut quo. Unde harum nulla consequatur voluptatem. Eveniet omnis molestiae officiis sunt. Ut qui maxime qui accusantium fugiat dignissimos maiores.', 5, 0, 1, '1981-05-30 13:04:44', '2012-09-12 22:18:26');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (72, 2, 3, 'consequatur', 'Qui autem accusantium accusantium aut. Soluta iste molestiae aut voluptas nisi distinctio. Nam error placeat a nihil vel doloribus dolores. Quisquam non commodi labore maiores occaecati voluptatem pariatur amet.', 3, 0, 1, '2004-06-19 20:51:04', '1992-08-03 19:36:43');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (73, 2, 8, 'totam', 'Amet similique aut sint modi porro eius. Dolor commodi adipisci sed ratione modi. Dicta et non eaque sapiente iste.', 2, 0, 1, '1971-12-31 14:15:25', '1974-08-18 22:37:38');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (74, 5, 4, 'eum', 'Sit et possimus eum aut necessitatibus. Quam itaque ut et perferendis beatae. Fuga maxime tenetur enim illum labore. Tenetur explicabo magnam modi sit ut qui.', 3, 1, 1, '1998-07-02 09:30:26', '1986-05-24 01:29:44');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (75, 2, 0, 'aut', 'Odio placeat et voluptate amet labore ab sunt. Aperiam quae modi non illum ducimus. Dicta eius incidunt et cum.', 7, 1, 0, '1970-06-04 00:29:45', '2002-12-22 07:56:17');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (76, 8, 9, 'aut', 'Blanditiis rerum est ducimus. Voluptatem reiciendis eligendi laudantium consequatur autem at. Molestias repellendus dolore sit voluptatum repellat nulla rem.', 3, 0, 0, '1986-12-04 04:28:05', '2005-07-18 22:07:00');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (77, 1, 5, 'officia', 'Et id in dolorum voluptates nobis non repellendus. Eos tenetur iure nihil autem repudiandae ullam eveniet. Et ad magnam sit ut rerum doloremque. Eum non dolor sit at at perspiciatis qui. Rerum molestiae aliquam voluptatibus qui perferendis beatae nihil inventore.', 1, 1, 0, '1976-11-13 04:39:06', '1974-10-31 06:37:30');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (78, 9, 6, 'libero', 'Quae nisi eos cumque magnam dignissimos. Impedit unde et rerum corrupti. Aut qui omnis voluptates rerum.', 6, 0, 0, '1987-02-09 22:35:19', '1997-01-18 10:05:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (79, 7, 9, 'voluptas', 'Nesciunt quidem eveniet voluptatem non et dolores magni. Iusto sint voluptates repudiandae dicta. Deserunt perspiciatis ullam nihil.', 7, 1, 0, '2004-08-17 09:58:03', '2004-01-26 06:25:13');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (80, 4, 9, 'officia', 'Dolorum voluptates et iusto ut aliquam reprehenderit. Sint quam soluta sed unde voluptas.', 2, 0, 0, '2014-03-18 13:01:46', '1978-12-13 04:12:11');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (81, 8, 7, 'officia', 'Autem tempora ratione ab sit delectus sunt ipsam. Necessitatibus et exercitationem eos. Vel quia delectus alias.', 3, 1, 1, '2013-04-05 15:34:47', '1976-06-06 16:28:14');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (82, 1, 3, 'asperiores', 'Velit sapiente commodi velit assumenda est sint corporis. Qui suscipit est blanditiis aut. Dolores neque velit deleniti aspernatur consequatur neque ut. Sed aut facilis velit sint explicabo incidunt.', 7, 0, 1, '2004-08-10 02:34:39', '2000-12-05 02:51:56');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (83, 0, 7, 'ut', 'Occaecati est et et animi perspiciatis qui recusandae impedit. Sunt eos nemo vel ea. Velit necessitatibus quos soluta.', 4, 0, 0, '1994-08-05 23:47:52', '1976-04-22 21:45:22');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (84, 3, 7, 'necessitatibus', 'Sit quia quae animi eveniet. Aliquid amet et qui modi. Consequuntur molestias molestiae nam omnis non adipisci quis. Et esse accusamus autem quos sapiente autem.', 5, 1, 1, '2009-03-17 16:55:57', '1998-11-25 21:19:40');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (85, 7, 8, 'omnis', 'Ut similique assumenda voluptates qui illum et velit. Nihil delectus dolorem sunt ut et.', 6, 0, 0, '2012-10-22 23:37:20', '1982-12-05 11:24:13');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (86, 9, 6, 'necessitatibus', 'Sit et fugit et. Culpa nulla quibusdam adipisci sint aut. Pariatur vel eius ad quisquam vel eos voluptas.', 3, 0, 0, '2006-09-02 00:13:05', '2004-03-06 16:58:54');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (87, 2, 4, 'tenetur', 'Vero culpa dignissimos consequatur voluptatem velit. Earum dolores sit sunt soluta beatae a. Harum non eos architecto eaque et inventore suscipit. Veritatis dolor vitae ullam libero ea occaecati ut.', 7, 1, 0, '2020-03-06 00:50:16', '1995-07-18 10:38:10');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (88, 9, 3, 'sit', 'Quis velit omnis voluptas aut doloremque. Eos non doloribus doloremque nam. Atque quisquam ut voluptates.', 0, 0, 1, '2000-10-07 06:02:03', '2002-07-21 09:22:38');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (89, 4, 5, 'qui', 'Ab doloribus minus et blanditiis dolorum cum harum molestiae. Id odit corporis illum fugit provident. Quasi quos qui accusantium natus enim ullam nam. Maiores ipsum quidem non optio.', 4, 1, 1, '2020-09-08 20:49:09', '2016-07-09 15:13:49');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (90, 9, 6, 'quia', 'Distinctio reprehenderit pariatur sed eos pariatur asperiores. Vel deleniti cum rem qui in nemo. Distinctio sequi eius et harum vel. Facilis dolorem aliquam similique qui voluptatem dolorum id.', 7, 0, 0, '1996-09-30 23:51:20', '2008-05-20 05:07:13');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (91, 8, 4, 'fuga', 'Cupiditate tempora a omnis rerum et eum et. Quisquam magni consequuntur corrupti eum aspernatur.', 0, 1, 1, '1988-11-09 18:51:34', '2011-03-11 17:45:39');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (92, 9, 6, 'aliquid', 'Veniam doloremque quis sit aut. Doloremque expedita molestias repellendus. Quasi eveniet reprehenderit debitis voluptatem voluptas tenetur libero. Quia dicta eaque est dolores dolor sunt. Ea et assumenda quaerat recusandae.', 4, 0, 0, '1972-06-06 11:36:12', '2009-07-05 00:13:03');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (93, 9, 9, 'illum', 'Sit aut repellat ad blanditiis consequatur qui corporis. Recusandae eos repudiandae excepturi eum. Ullam deserunt fugiat at aut at. Dolore officiis facilis error non.', 1, 0, 1, '1999-03-13 01:13:20', '2019-05-12 16:44:32');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (94, 4, 2, 'at', 'Inventore qui amet consequatur a. Repudiandae explicabo facilis qui tempora est. Quia atque placeat officia. Quas repellat corrupti fugit omnis. Sint odit non nihil ut recusandae minima fuga.', 5, 1, 0, '1995-07-09 10:42:08', '1989-01-18 08:26:49');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (95, 8, 7, 'consequatur', 'Vitae veniam in dolor. Vero qui inventore et distinctio quia temporibus sed. Dignissimos est ea labore dolores optio. Nihil iusto sapiente quidem.', 2, 0, 1, '1976-03-04 02:00:23', '1999-10-25 12:16:36');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (96, 3, 7, 'temporibus', 'Aut sint natus aut expedita fugiat iure officiis soluta. Rerum impedit et saepe ut non non. Aut quisquam aliquid et voluptas nulla possimus quibusdam.', 3, 0, 1, '1972-12-25 01:57:05', '2004-07-02 00:42:33');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (97, 3, 7, 'atque', 'Voluptatem laudantium perferendis nemo est. Ab alias sit deserunt rem in quisquam modi cupiditate. Veniam velit deleniti aperiam ea ipsa et.', 4, 0, 0, '1986-07-01 14:56:29', '1977-08-27 10:03:33');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (98, 4, 9, 'pariatur', 'Dolores eligendi nesciunt et enim. Nulla eos dolorem qui nisi ut dolor quo. Minus facilis temporibus ea et ab est dicta. Est tenetur debitis omnis enim dolores.', 7, 0, 1, '2005-05-12 00:21:21', '2000-03-12 21:03:28');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (99, 9, 5, 'tenetur', 'In corporis magni esse harum. Odit et illum ad natus fugiat eos ut. Consequatur et quas neque voluptatem excepturi.', 6, 0, 1, '1998-07-03 00:11:47', '2013-02-08 09:08:14');
INSERT INTO `posts` (`id`, `user_id`, `community_id`, `head`, `body`, `media_id`, `is_public`, `is_archived`, `created_at`, `updated_at`) VALUES (100, 3, 5, 'odit', 'Est est ut blanditiis et quibusdam. Ut qui quo est maiores facilis et. Vero sunt est magnam debitis consequatur sunt.', 4, 0, 0, '2000-07-12 14:16:19', '1989-04-04 16:19:03');

UPDATE posts SET user_id = user_id + 1 WHERE user_id = 0;
UPDATE posts SET community_id = community_id + 1 WHERE community_id = 0;
UPDATE posts SET media_id = media_id + 1 WHERE media_id = 0;
update posts SET updated_at = TIMESTAMPADD(second, FLOOR(rand() * (TIMESTAMPDIFF(minute, created_at, now()))), created_at);


-- 
-- Создать все необходимые внешние ключи и диаграмму отношений.

DESC profiles ;
ALTER TABLE profiles 
	ADD CONSTRAINT profiles_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id);

DESC  messages ;
ALTER TABLE messages 
	ADD CONSTRAINT messages_from_user_id_fk
		FOREIGN KEY (from_user_id) REFERENCES users(id),
	ADD CONSTRAINT messages_to_user_id_fk
		FOREIGN KEY (to_user_id) REFERENCES users(id)
		;

DESC communities_users ;
ALTER TABLE communities_users 
	ADD CONSTRAINT communities_users_community_id_fk
		FOREIGN KEY (community_id) REFERENCES communities(id),
	ADD CONSTRAINT communities_users_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id);

DESC friendship ;
ALTER TABLE friendship 
	ADD CONSTRAINT friendship_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT friend_id_fk
		FOREIGN KEY (friend_id) REFERENCES users(id);
	
-- 	Как условие поставить не нашел 
-- DESC likes ;
-- ALTER TABLE likes 
-- 	ADD CONSTRAINT likes_user_id_fk
-- 		FOREIGN KEY (user_id) REFERENCES users(id),
-- 	ADD CONSTRAINT friend_id_fk
-- 		FOREIGN KEY (target_id) REFERENCES users(id)
-- 	;
	
DESC media ;
ALTER TABLE media 
	ADD CONSTRAINT media_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT media_media_type_id_fk
		FOREIGN KEY (media_type_id) REFERENCES media_types(id)
	;

DESC posts ;	
ALTER TABLE posts 
	ADD CONSTRAINT posts_user_id_fk
		FOREIGN KEY (user_id) REFERENCES users(id),
	ADD CONSTRAINT posts_community_id_fk
		FOREIGN KEY (community_id) REFERENCES communities(id)
		;
	
DESC users ;
-- 
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT * FROM profiles p ;
SELECT * FROM likes l ;
SELECT count(id), (SELECT gender FROM profiles p WHERE p.user_id = l.user_id) AS gender FROM likes l GROUP BY gender ;


-- 
-- Вывести для каждого пользователя количество созданных сообщений, постов, загруженных медиафайлов и поставленных лайков.
SELECT from_user_id, count(from_user_id) AS messages FROM messages GROUP BY from_user_id ORDER BY from_user_id ;
SELECT user_id, count(user_id) AS posts FROM posts GROUP BY user_id ORDER BY user_id ;
SELECT user_id, count(user_id) AS media FROM media GROUP BY user_id ORDER BY user_id ;
SELECT user_id, count(target_id) AS likes FROM likes l GROUP BY user_id ORDER BY user_id ;


-- 5. (по желанию) Подсчитать количество лайков которые получили
-- 10 самых молодых пользователей. 


-- решил просто создать отдельные таблицы 
DROP TABLE ll;     
CREATE TEMPORARY TABLE ll (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type VARCHAR(255),
  created_at DATE,
  who_id INT
);

INSERT INTO ll
(SELECT *, 
	   (SELECT user_id FROM posts p WHERE id = target_id) AS who_write_user_id  
--     (SELECT birthday FROM profiles WHERE user_id = target_id) AS who_write_birthday
       FROM likes l WHERE target_type = 'posts')
UNION
(SELECT *, 
	   (SELECT user_id FROM messages WHERE id = target_id) AS who_write_user_id  
--     (SELECT birthday FROM profiles WHERE user_id = target_id) AS who_write_birthday
       FROM likes l WHERE target_type = 'messages')
UNION
(SELECT *, 
	   (SELECT user_id FROM media WHERE id = target_id) AS who_write_user_id  
--     (SELECT birthday FROM profiles WHERE user_id = target_id) AS who_write_birthday
       FROM likes l WHERE target_type = 'media')
UNION
(SELECT *, 
	   (SELECT user_id FROM users WHERE id = target_id) AS who_write_user_id  
--     (SELECT birthday FROM profiles WHERE user_id = target_id) AS who_write_birthday
       FROM likes l WHERE target_type = 'users');
      
DROP TABLE dd;
CREATE TEMPORARY TABLE dd (
  user_id INT UNSIGNED NOT NULL
);
INSERT INTO dd
SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10;

SELECT who_id, count(who_id) AS count_like FROM ll WHERE who_id in (SELECT user_id FROM dd) GROUP BY who_id ORDER BY count_like DESC;
