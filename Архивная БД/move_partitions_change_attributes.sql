BEGIN
  FOR i IN (
    SELECT * FROM ALL_tables where owner = 'SIP_SM' and partitioned = 'YES'
  ) LOOP
    EXECUTE IMMEDIATE 'ALTER TABLE ' || i.table_name || ' MODIFY DEFAULT ATTRIBUTES TABLESPACE ' || 'USERS2';
  END LOOP;
END;


--SELECT 'ALTER TABLE '|| TABLE_OWNER||'.'||TABLE_NAME||' MOVE PARTITION ' ||  PARTITION_NAME||  ' TABLESPACE ARCHIVE;'  FROM ALL_tab_partitions 
--WHERE TABLE_OWNER = 'owner_name' 
--AND table_NAME NOT LIKE 'BIN$%';