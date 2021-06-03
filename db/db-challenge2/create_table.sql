CREATE TABLE users (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  email varchar(13) NOT NULL,
  password varchar(100) NOT NULL,
  display_name varchar(100) NOT NULL,
  self_introduce varchar(100),
  work_phone_number char(13),
  mobile_phone_number char(13),
  is_deleted tinyint(1) NOT NULL DEFAULT 0,
  created_at date NOT NULL,
  updated_at date NOT NULL,
)

CREATE TABLE chat_contents (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  post_user_id int(11) REFERENCES users(id) NOT NULL PRIMARY KEY,
  updated_user_id int(11) REFERENCES user(id) NOT NULL,
  chatroom_id int(11) REFERENCES chatrooms(id) NOT NULL,
  post_content varchar(1000) NOT NULL,
  attchment_file_name varchar(1000) NOT NULL,
  is_deleted tinyint(1) NOT NULL DEFAULT 0,
  created_at date NOT NULL,
  updated_at date NOT NULL,
)

CREATE TABLE chatrooms (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  created_user_id int(11) REFERENCES users(id) NOT NULL,
  updated_user_id int(11) REFERENCES users(id) NOT NULL,
  chat_name varchar(100) NOT NULL,
  chat_overview varchar(100) NOT NULL,
  is_attchment_file tinyint(1) DEFAULT 0 NOT NULL,
  is_direct_chat tinyint(1) DEFAULT 0 NOT NULL,
  is_deleted tinyint(1) DEFAULT 0 NOT NULL,
  created_at date NOT NULL,
  updated_at date NOT NULL,
)

CREATE TABLE tasks (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  task_user_id int(11) NOT NULL REFERENCES users(id),
  created_user_id int(11) NOT NULL REFERENCES users(id),
  updated_user_id int(11) NOT NULL REFERENCES users(id),
  chatrooms_id int(11) NOT NULL REFERENCES users(id),
  task_content varchar(1000) NOT NULL,
  deadline date NOT NULL,
  finish_date NOT NULL,
  is_deleted tinyint(1) DEFAULT 0 NOT NULL,
  created_at date NOT NULL,
  updated_at date NOT NULL
)

CREATE TABLE chatroom_join_users (
  id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id int(11) NOT NULL REFERENCES users(id),
  chatroom_id int(11) NOT NULL REFERENCES chatrooms(id),
  created_at date NOT NULL
)
