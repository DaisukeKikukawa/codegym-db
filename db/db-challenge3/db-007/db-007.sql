SELECT id,
post_user_id,
update_user_id,
chat_name,
chat_overview,
CASE can_send_file 
WHEN 0 THEN '許可'
WHEN 1 THEN '禁止'
END AS ファイル送信,
is_direct_chat,
is_deleted,
created_at,
updated_at
FROM chatrooms
WHERE chat_overview LIKE '%ダイレクトチャット'AND is_deleted = 0
ORDER BY id ASC;
