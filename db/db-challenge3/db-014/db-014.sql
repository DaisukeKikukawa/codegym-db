BEGIN;
DELETE cu
FROM
  chatroom_users as cu
  JOIN users as u ON cu.user_id = u.id
WHERE
  u.is_deleted = 1;
COMMIT;


BEGIN;
DELETE 
      chatroom_join_users
FROM
      chatroom_join_users
JOIN
      users
ON
      chatroom_join_users.user_id = users.id
WHERE
      users.is_deleted = 1;
COMMIT;
