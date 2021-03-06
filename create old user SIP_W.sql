DROP USER SIP_W CASCADE;

CREATE USER SIP_W
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 5 Roles for SIP_W 
  GRANT CONNECT TO SIP_W WITH ADMIN OPTION;
  GRANT DBA TO SIP_W;
  GRANT EXECUTE_CATALOG_ROLE TO SIP_W;
  GRANT RESOURCE TO SIP_W WITH ADMIN OPTION;
  GRANT SIP_DBA TO SIP_W;
  ALTER USER SIP_W DEFAULT ROLE ALL;
  -- 14 System Privileges for SIP_W 
  GRANT CREATE ANY CONTEXT TO SIP_W;
  GRANT CREATE ANY SYNONYM TO SIP_W;
  GRANT CREATE DATABASE LINK TO SIP_W;
  GRANT CREATE LIBRARY TO SIP_W;
  GRANT CREATE MATERIALIZED VIEW TO SIP_W;
  GRANT CREATE PROCEDURE TO SIP_W;
  GRANT CREATE PUBLIC SYNONYM TO SIP_W;
  GRANT CREATE SYNONYM TO SIP_W;
  GRANT CREATE TABLE TO SIP_W;
  GRANT CREATE TRIGGER TO SIP_W;
  GRANT CREATE VIEW TO SIP_W;
  GRANT DROP ANY CONTEXT TO SIP_W;
  GRANT SELECT ANY DICTIONARY TO SIP_W;
  GRANT UNLIMITED TABLESPACE TO SIP_W WITH ADMIN OPTION;
  -- 1 Tablespace Quota for SIP_W 
  ALTER USER SIP_W QUOTA UNLIMITED ON USERS;
  -- 69 Object Privileges for SIP_W 
    GRANT DELETE, SELECT, UPDATE ON SIP_IBS.ABON_DATA TO SIP_W WITH GRANT OPTION;
  GRANT INSERT ON SIP_IBS.ABON_DATA TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.ABS_EXP_ACTION TO SIP_W WITH GRANT OPTION;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.ABS_EXP_CARD_PAYMENTS TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.ABS_EXP_IPTV_CHANNEL TO SIP_W WITH GRANT OPTION;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.ABS_EXP_IPTV_CHANNEL_OLD TO SIP_W WITH GRANT OPTION;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.ABS_EXP_PAYMENTS TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.ABS_EXP_SERVICES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.ABS_EXP_SERVICES_OLD TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.ABS_EXP_SERVICES_R TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.ABS_TESTLINK TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.CHECK_CHANNEL TO SIP_W;
    GRANT SELECT ON SIP_IBS.DOUBLE_IPTV_LOGIN TO SIP_W;
    GRANT SELECT ON SIP_IBS.DOUBLE_IPTV_T_SERVICES TO SIP_W;
    GRANT SELECT ON SIP_IBS.FIX_UC_IPTV TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_ACC_HIST TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_ACCOUNTS TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_BLOCK_CODES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_BM_CODES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_CATEGORIES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_CUR_CODES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_INTERNET_ALL TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_LOG TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_PAYMENTS TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_PAYMENTS_HIST TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_PAY_TYPES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_PHONES TO SIP_W WITH GRANT OPTION;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_PHONES_JN TO SIP_W WITH GRANT OPTION;
    GRANT SELECT ON SIP_IBS.IBS_ABS_PHONES$V TO SIP_W WITH GRANT OPTION;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_PROVIDERS TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_SERV_CODES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_STATUS_CODES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_TARIFF TO SIP_W;
    GRANT SELECT ON SIP_IBS.IBS_ABS_TARIFF_VALID TO SIP_W WITH GRANT OPTION;
  GRANT DELETE, INSERT, UPDATE ON SIP_IBS.IBS_ABS_TARIFF_VALID TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_TECH_CODES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_T_SERVICE_USER_NAME TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_UNIT_CODES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_USERS TO SIP_W;
    GRANT SELECT ON SIP_IBS.IBS_ABS_VALID_BM_CODES TO SIP_W;
    GRANT SELECT ON SIP_IBS.IBS_ABS_VALID_PAY_TYPES TO SIP_W;
    GRANT SELECT ON SIP_IBS.IBS_ABS_VALID_SERV_CODES TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_VOIP_CORP TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_ABS_VOIP_EXP TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_FILIALS TO SIP_W;
    GRANT DELETE, SELECT, UPDATE ON SIP_IBS.IBS_LOAD_ZONES_VOIP TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_PHONES_WAITING TO SIP_W WITH GRANT OPTION;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_PREFIXS TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_PROVIDERS TO SIP_W;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.IBS_SCHEMS TO SIP_W;
    GRANT SELECT ON SIP_IBS.LOG_ID TO SIP_W;
    GRANT ALTER, DELETE, INSERT, SELECT, UPDATE ON SIP_IBS.TB_CROSS_USL TO SIP_W;
    GRANT SELECT ON SYS.DBA_JOBS_RUNNING TO SIP_W;
    GRANT EXECUTE ON SYS.DBMS_AQ TO SIP_W;
    GRANT EXECUTE ON SYS.DBMS_AQADM TO SIP_W;
    GRANT EXECUTE ON SYS.DBMS_AQ_BQVIEW TO SIP_W;
    GRANT EXECUTE ON SYS.DBMS_JOB TO SIP_W;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO SIP_W;
    GRANT EXECUTE ON SYS.DBMS_PIPE TO SIP_W;
    GRANT EXECUTE ON SYS.DBMS_RLS TO SIP_W;
    GRANT EXECUTE ON SYS.DBMS_SESSION TO SIP_W;
    GRANT EXECUTE ON SYS.DBMS_SYSTEM TO SIP_W;
    GRANT SELECT ON SYS.QT88089_BUFFER TO SIP_W;
    GRANT SELECT ON SYS.QT88136_BUFFER TO SIP_W;
    GRANT SELECT ON SYS.QT88139_BUFFER TO SIP_W;
    GRANT SELECT ON SYS.V_$BH TO SIP_W;
    GRANT SELECT ON SYS.V_$MYSTAT TO SIP_W;
    GRANT SELECT ON SYS.V_$PROCESS TO SIP_W;
    GRANT SELECT ON SYS.V_$SESSION TO SIP_W;
    GRANT SELECT ON SYS.V_$SESSTAT TO SIP_W;
    GRANT SELECT ON SYS.V_$STATNAME TO SIP_W;
