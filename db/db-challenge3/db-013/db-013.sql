BEGIN;
UPDATE
      users
SET
      is_deleted = 1,
      updated_at = NOW()
WHERE
      (work_phone_number IS NULL OR work_phone_number = ' ')
AND
      (mobile_phone_number IS NULL OR mobile_phone_number = ' ');
COMMIT;
