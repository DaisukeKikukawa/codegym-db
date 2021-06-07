BEGIN;
UPDATE
      tasks
SET
      is_finished = 1,
      updated_user_id = 1,
      created_at = NOW()
WHERE created_at BETWEEN '2020-04-26 09:00:00' AND '2020-04-26 11:30:00' AND is_deleted = 0;
COMMIT;
