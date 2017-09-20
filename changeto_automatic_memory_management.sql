/*
SHOW PARAMETER TARGET

838860800 pga_aggregate_target 800MB
2516582400 sga_target 2400MB



SQL>ALTER SYSTEM SET MEMORY_MAX_TARGET = 808M SCOPE = SPFILE;
SQL>ALTER SYSTEM SET MEMORY_TARGET = 808M SCOPE = SPFILE;
SQL>ALTER SYSTEM SET SGA_TARGET =0 SCOPE = SPFILE;
SQL>ALTER SYSTEM SET PGA_AGGREGATE_TARGET = 0 SCOPE = SPFILE;
*/

--select * from v$memory_target_advice order by memory_size;
ALTER SYSTEM SET MEMORY_MAX_TARGET = 3300M SCOPE = SPFILE;
ALTER SYSTEM SET MEMORY_TARGET = 3300M SCOPE = SPFILE;
ALTER SYSTEM SET SGA_TARGET =0 SCOPE = SPFILE;
ALTER SYSTEM SET PGA_AGGREGATE_TARGET = 0 SCOPE = SPFILE;