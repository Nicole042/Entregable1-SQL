create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50) 
);

insert into users (first_name, last_name, email) values
('Roman', 'Rojas', 'romanro@gmail.com'),
('Monica', 'Gonzales','Mogo@gmail.com'),
('Mauro', 'Perez', 'perez@gmail.com')

select * from users

create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(50),
	text varchar(50) 
);

insert into posts (creator_id, title, text) values
(3, 'Buenos dias', 'Lorem ipsum dolor sit amet.'),
(1, 'Hola mundo', 'Vestibulum ac tincidunt odio.'),
(2, 'Saludos', 'Sed quis sem lectus. Donec viverra dolor.'),
(1, 'Hola', 'Vestibulum ac.'),
(2, 'Mañana', 'Sed quis sem lectus.')

select * from posts

create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

insert into likes (user_id, post_id) values 
	(1, 3),
	(3, 1),
	(2, 2),
	(1, 2),
	(3, 3);

-- users - posts

select posts.title, posts.text, users.first_name, users.last_name, users.email from posts
inner join users 
on users.id = posts.creator_id

--posts - likes - users

select posts.title, users.first_name, users.last_name, users.email from posts
inner join likes  
on posts.id = likes.post_id
inner join users
on likes.user_id = users.id









