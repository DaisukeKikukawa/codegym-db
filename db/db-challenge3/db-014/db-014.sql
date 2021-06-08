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
