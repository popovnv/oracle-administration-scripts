CREATE PROFILE ARGUS_SYSTEM_PROFILE LIMIT
  SESSIONS_PER_USER UNLIMITED
  CPU_PER_SESSION UNLIMITED
  CPU_PER_CALL UNLIMITED
  CONNECT_TIME UNLIMITED
  IDLE_TIME UNLIMITED
  LOGICAL_READS_PER_SESSION UNLIMITED
  LOGICAL_READS_PER_CALL UNLIMITED
  COMPOSITE_LIMIT UNLIMITED
  PRIVATE_SGA UNLIMITED
  FAILED_LOGIN_ATTEMPTS UNLIMITED
  PASSWORD_LIFE_TIME UNLIMITED
  PASSWORD_REUSE_TIME UNLIMITED
  PASSWORD_REUSE_MAX UNLIMITED
  PASSWORD_LOCK_TIME UNLIMITED
  PASSWORD_GRACE_TIME UNLIMITED
  PASSWORD_VERIFY_FUNCTION NULL;

CREATE ROLE argus_user NOT IDENTIFIED;
GRANT CREATE SESSION TO argus_user;
CREATE ROLE ARGUS_MODEL_DEV NOT IDENTIFIED;
CREATE ROLE ARGUS_READONLY_USER NOT IDENTIFIED;

CREATE USER ARGUS_READER_
  IDENTIFIED BY VALUES '4AFD41E0E486EAB2'
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for ARGUS_READER_ 
  GRANT ARGUS_READONLY_USER TO ARGUS_READER_;
  ALTER USER ARGUS_READER_ DEFAULT ROLE ALL;

CREATE USER ts_
  IDENTIFIED BY VALUES '357CE43167C65E24'
  DEFAULT TABLESPACE argus
  TEMPORARY TABLESPACE argus_temp
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for TS_ 
GRANT   argus_user TO ts_;
ALTER   USER ts_ DEFAULT ROLE ALL;
  -- 2 Tablespace Quotas for TS_ 
ALTER   USER ts_ QUOTA UNLIMITED ON argus;

CREATE USER developer_
  IDENTIFIED BY VALUES '7CE5BF717569A692'
  DEFAULT TABLESPACE argus
  TEMPORARY TABLESPACE argus_temp
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 2 Roles for DEVELOPER_ 
GRANT   argus_user TO developer_;
ALTER   USER developer_ DEFAULT ROLE ALL;
  -- 2 Tablespace Quotas for DEVELOPER_ 
ALTER   USER developer_ QUOTA UNLIMITED ON argus;

CREATE USER ARGUS_SYS
  IDENTIFIED BY VALUES '58DA9D50133154C9'
  DEFAULT TABLESPACE ARGUS
  TEMPORARY TABLESPACE TEMP
  PROFILE ARGUS_SYSTEM_PROFILE
  ACCOUNT UNLOCK;
  -- 6 Roles for ARGUS_SYS 
  GRANT ARGUS_MODEL_DEV TO ARGUS_SYS WITH ADMIN OPTION;
  
  GRANT IMP_FULL_DATABASE TO ARGUS_SYS;
  
  GRANT DBA TO ARGUS_SYS;
  GRANT ARGUS_USER TO ARGUS_SYS WITH ADMIN OPTION;
  ALTER USER ARGUS_SYS DEFAULT ROLE DBA;
  -- 10 System Privileges for ARGUS_SYS 
  GRANT DROP USER TO ARGUS_SYS WITH ADMIN OPTION;
  GRANT CREATE PROCEDURE TO ARGUS_SYS;
  GRANT CREATE TABLE TO ARGUS_SYS;
  GRANT RESTRICTED SESSION TO ARGUS_SYS;
  GRANT CREATE USER TO ARGUS_SYS WITH ADMIN OPTION;
  GRANT CREATE SESSION TO ARGUS_SYS WITH ADMIN OPTION;
  GRANT ADMINISTER DATABASE TRIGGER TO ARGUS_SYS;
  GRANT UNLIMITED TABLESPACE TO ARGUS_SYS;
  GRANT CREATE TRIGGER TO ARGUS_SYS;
  GRANT ALTER USER TO ARGUS_SYS WITH ADMIN OPTION;
  -- 1 Tablespace Quota for ARGUS_SYS 
  ALTER USER ARGUS_SYS QUOTA UNLIMITED ON ARGUS;
GRANT SELECT ON SYS.ALL_USERS TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_OBJECTS TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_PROFILES TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_ROLE_PRIVS TO ARGUS_SYS;
    GRANT SELECT ON SYS.DBA_TAB_PRIVS TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_USERS TO ARGUS_SYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_SYSTEM TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.GV_$PARAMETER TO ARGUS_SYS WITH GRANT OPTION;
    
    GRANT UPDATE ON SYS.SEQ$ TO ARGUS_SYS;
    
    GRANT EXECUTE ON SYS.UTL_RAW TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$BGPROCESS TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$LOCK TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$OPEN_CURSOR TO ARGUS_SYS;
    GRANT SELECT ON SYS.V_$PROCESS TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$SESSION TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$SESS_IO TO ARGUS_SYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$SQLTEXT_WITH_NEWLINES TO ARGUS_SYS;

CREATE USER argus_admin
  IDENTIFIED BY VALUES '886C2350EE743934'
  DEFAULT TABLESPACE argus
  TEMPORARY TABLESPACE argus_temp
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 2 Roles for ARGUS_ADMIN 
GRANT   CONNECT TO argus_admin;
GRANT   argus_user TO argus_admin WITH ADMIN OPTION;
ALTER   USER argus_admin DEFAULT ROLE ALL;
  -- 4 System Privileges for ARGUS_ADMIN 
GRANT   DROP USER TO argus_admin;
GRANT   ALTER USER TO argus_admin;
GRANT   CREATE USER TO argus_admin;
GRANT   CREATE TABLE TO argus_admin WITH ADMIN OPTION;
  -- 1 Tablespace Quota for ARGUS_ADMIN 
ALTER   USER argus_admin QUOTA UNLIMITED ON argus;
  -- 13 Object Privileges for ARGUS_ADMIN 


GRANT     SELECT ON  SYS.all_users TO argus_admin WITH GRANT OPTION;
GRANT     SELECT ON  SYS.dba_objects TO argus_admin WITH GRANT OPTION;
GRANT     SELECT ON  SYS.dba_profiles TO argus_admin;
GRANT     SELECT ON  SYS.dba_tab_privs TO argus_admin WITH GRANT OPTION;
GRANT     SELECT ON  SYS.dba_users TO argus_admin WITH GRANT OPTION;
GRANT     SELECT ON  SYS.gv_$parameter TO argus_admin WITH GRANT OPTION;
GRANT     SELECT ON  SYS.v_$bgprocess TO argus_admin WITH GRANT OPTION;
GRANT     SELECT ON  SYS.v_$lock TO argus_admin WITH GRANT OPTION;
GRANT     SELECT ON  SYS.v_$process TO argus_admin WITH GRANT OPTION;
GRANT     SELECT ON  SYS.v_$session TO argus_admin WITH GRANT OPTION;
GRANT     SELECT ON  SYS.v_$sess_io TO argus_admin WITH GRANT OPTION;


CREATE USER ao_
  IDENTIFIED BY VALUES '40FE7027B4D3A0C6'
  DEFAULT TABLESPACE argus
  TEMPORARY TABLESPACE argus_temp
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for AO_ 
GRANT   argus_user TO ao_;
ALTER   USER ao_ DEFAULT ROLE ALL;
  -- 2 Tablespace Quotas for AO_ 
ALTER   USER ao_ QUOTA UNLIMITED ON argus;

--ACCEPT utl NUMBER PROMPT 'utl_dir : (default: c:\oracle\admin\argus\utl)'

CREATE OR REPLACE DIRECTORY
utl_file_dir AS
'/db/targusKTP/utl';

--RECREATE_DIR 
--ACCEPT recr NUMBER PROMPT 'utl_dir : (default: c:\oracle\admin\argus\dpdump)'

CREATE OR REPLACE DIRECTORY 
RECREATE_DIR AS 
'/db/targusKTP/dpdump';


GRANT READ, WRITE ON DIRECTORY  RECREATE_DIR TO ARGUS_SYS WITH GRANT OPTION;
GRANT READ, WRITE ON DIRECTORY  utl_file_dir TO argus_sys WITH GRANT OPTION;

@?/rdbms/admin/utlmail.sql
@?/rdbms/admin/prvtmail.plb


GRANT READ, WRITE ON DIRECTORY  RECREATE_DIR TO ARGUS_SYS WITH GRANT OPTION;
GRANT READ, WRITE ON DIRECTORY  utl_file_dir TO argus_sys WITH GRANT OPTION;                                                                                                                                                                                        
grant execute on sys.utl_mail to argus_sys with grant option; 
grant execute on sys.utl_mail to public;
grant execute on sys.dbms_lock to public;
