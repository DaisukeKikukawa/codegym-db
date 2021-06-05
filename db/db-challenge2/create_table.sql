CREATE TABLE users (
  id int(11) unsigned not null primary key auto_increment,
  email varchar(20) not null,
  password varchar(100) not null,
  display_name varchar(100) not null,
  self_introduce text(1000),
  work_phone_number char(13),
  mobile_phone_number char(13),
  is_deleted tinyint(1) not null default 0,
  created_at datetime not null default current_timestamp,
  updated_at datetime not null default current_timestamp
);

CREATE TABLE chatrooms (
  id int(11) unsigned not null primary key auto_increment,
  post_user_id int(11) unsigned not null references users(id),
  update_user_id int(11) unsigned not null references users(id),
  chat_name varchar(100) not null,
  chat_overview text(1000),
  can_send_file tinyint(1) default 0 not null,
  is_direct_chat tinyint(1) default 0 not null,
  is_deleted tinyint(1) default 0 not null,
  created_at datetime not null default current_timestamp,
  updated_at datetime not null default current_timestamp
);

CREATE TABLE chat_contents (
  id int(11) unsigned not null primary key auto_increment,
  post_user_id int(11) unsigned not null references users(id),
  update_user_id int(11) unsigned not null references user(id),
  chatroom_id int(11) unsigned not null references chatrooms(id),
  post_content text(1000) not null,
  attchment_file_name varchar(100),
  is_deleted tinyint(1) not null default 0,
  created_at datetime not null default current_timestamp,
  updated_at datetime not null default current_timestamp
);

CREATE TABLE tasks (
  id int(11) unsigned not null primary key auto_increment,
  task_user_id int(11) unsigned not null references users(id),
  created_user_id int(11) unsigned not null references users(id),
  updated_user_id int(11) unsigned not null references users(id),
  chatroom_id int(11) unsigned not null references users(id),
  task_content text(1000) not null,
  deadline datetime,
  is_finised tinyint(1)  not null default 0,
  is_deleted tinyint(1) default 0 not null,
  created_at datetime not null default current_timestamp,
  updated_at datetime not null default current_timestamp
);

CREATE TABLE chatroom_join_users (
  id int(11) unsigned not null primary key auto_increment,
  user_id int(11) unsigned not null references users(id),
  chatroom_id int(11) unsigned not null references chatrooms(id),
  created_at datetime not null default current_timestamp
);
