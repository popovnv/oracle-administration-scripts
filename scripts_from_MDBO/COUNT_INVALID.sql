SELECT OWNER,
       OBJECT_TYPE,
       COUNT(*)
  FROM DBA_OBJECTS
 WHERE STATUS='INVALID'
GROUP BY  OWNER, OBJECT_TYPE
ORDER BY 3 DESC,1
