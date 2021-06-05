SELECT COUNT(*) as 投稿数,chatrooms.chat_name as チャットルーム名
FROM chat_contents
  JOIN chatrooms
  ON chat_contents.chatroom_id = chatrooms.id
  JOIN users 
  ON chat_contents.post_user_id = users.id
WHERE chat_contents.is_deleted = 0 AND users.is_deleted = 0
GROUP BY チャットルーム名
ORDER BY 投稿数 DESC;
