SELECT users.display_name as ユーザー名,
    chatrooms.chat_name as　チャットルーム名,
    DATE_FORMAT(chatroom_join_users.created_at,'%Y-%m-%d')  as 参加日時
FROM c
    hatroom_join_users
    JOIN users
    ON chatroom_join_users.user_id = users.id
    JOIN chatrooms 
    ON chatroom_join_users.chatroom_id = chatrooms.id
WHERE users.is_deleted = 0 AND chatrooms.is_deleted = 0
ORDER BY chatroom_join_users.created_at ASC;
