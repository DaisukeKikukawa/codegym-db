SELECT users.display_name as ユーザー名,chat_contents.created_at as 投稿日時,chatrooms.chat_name as チャットルーム名
FROM chat_contents
  JOIN users
  ON chat_contents.post_user_id = users.id
  JOIN chatrooms
  ON chat_contents.chatroom_id = chatrooms.id
WHERE users.is_deleted = 0 AND chat_contents.is_deleted = 0 AND chat_contents.created_at 
  IN (
    SELECT max(chat_contents.created_at)
      FROM chat_contents
      JOIN chatrooms
      ON chat_contents.chatroom_id=chatrooms.id
    GROUP BY chatrooms.chat_name
  )
  ORDER BY chatrooms.id ASC;
