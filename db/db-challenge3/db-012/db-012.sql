BEGIN;
UPDATE 
      chatrooms
JOIN
      chatroom_join_users
ON
      chatrooms.id = chatroom_join_users.chatroom_id
SET   
      chatrooms.can_send_file = 0,
      chatrooms.update_user_id = 1,
      updated_at = NOW()
WHERE 
      chatrooms.is_deleted = 0 AND chatroom_join_users.user_id != 1;
COMMIT;
