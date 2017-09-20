SELECT SID, SERIAL#, USERNAME, STATUS, TERMINAL, PROGRAM, SQL.SQL_ID, SQL.SQL_FULLTEXT, SQL.SORTS, SQL.EXECUTIONS, SQL.APPLICATION_WAIT_TIME, SQL.CONCURRENCY_WAIT_TIME, SQL.USER_IO_WAIT_TIME, SQL.ROWS_PROCESSED, SQL.OPTIMIZER_COST, SQL.CPU_TIME, SQL.ELAPSED_TIME
FROM V$SESSION SEES, V$SQL SQL
WHERE TYPE = 'USER'
AND SEES.SQL_ID = SQL.SQL_ID;