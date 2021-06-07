SELECT 
  id,
  email,
  password,
  display_name,
  self_introduce,
  work_phone_number,
  mobile_phone_number,
  is_deleted,
  created_at,
  updated_at 
FROM 
  users
ORDER BY 
  id ASC;
