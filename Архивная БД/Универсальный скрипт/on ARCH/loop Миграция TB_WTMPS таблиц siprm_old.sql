
declare
part varchar2(11);
dttm varchar2(19);
owner varchar2(50);
tablename varchar(50);
cnt varchar2(50);
string varchar2(2000);
dttm_start varchar2(8);
dttm_end varchar2(8);
numrows_arch number;
ex_custom EXCEPTION;
z exception;
PRAGMA EXCEPTION_INIT( ex_custom, -20001 );
i NUMBER := -38; --start sysdate - i
j NUMBER := -21; --end

BEGIN

dbms_output.put_line('Started at: '|| TO_CHAR(SYSDATE, 'DD.MM.YYYY HH24:MI:SS'));

LOOP 
    SELECT 'PART' || TO_CHAR(ADD_MONTHS (sysdate, i), 'YYYY_MM') into part from dual;
    SELECT TO_CHAR(ADD_MONTHS (sysdate, i), 'YYYY-MM') into dttm_start from dual;
    SELECT TO_CHAR(ADD_MONTHS (sysdate, i+1), 'YYYY-MM') into dttm_end from dual; --dttm_start + 1  
    dbms_output.put_line(part);
    dbms_output.put_line(dttm_start);
    dbms_output.put_line(dttm_end);         
    dbms_output.put_line(i);
    
    
    
--��������

    /*
select num_rows into numrows_arch from SIP_RM.PART_VIEW where table_name='TB_WTMPS_SESSIONS_ARCHIVE' and partition_name=part; --���-�� � �������� ��
    if (numrows_arch > 0)  then
    raise_application_error( -20001, '������ � SIPARCH TB_WTMPS_SESSIONS_ARCHIVE:'||part||' ��� �����������' );
    end if;
*/

--DBMS_STATS.GATHER_TABLE_STATS(ownname => 'SIP_W', tabname => 'TB_WTMPS_SESSIONS_ARCHIVE', partname => part, cascade => TRUE, ESTIMATE_PERCENT => NULL, granularity => 'PARTITION',DEGREE=>8);


insert /*+ APPEND */ into SIP_RM.TB_WTMPS_SESSIONS_ARCHIVE 
select * from TB_WTMPS_SESSIONS_ARCHIVE@SIPRM_OLD where
TWSA_START_DATE >= TO_DATE(dttm_start || '-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWSA_START_DATE <  TO_DATE(dttm_start || '-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

insert /*+ APPEND */ into SIP_RM.TB_WTMPS_SESSIONS_ARCHIVE 
select * from TB_WTMPS_SESSIONS_ARCHIVE@SIPRM_OLD where
TWSA_START_DATE >= TO_DATE(dttm_start || '-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWSA_START_DATE <  TO_DATE(dttm_start || '-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

insert /*+ APPEND */ into SIP_RM.TB_WTMPS_SESSIONS_ARCHIVE 
select * from TB_WTMPS_SESSIONS_ARCHIVE@SIPRM_OLD where
TWSA_START_DATE >= TO_DATE(dttm_start || '-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWSA_START_DATE <  TO_DATE(dttm_start || '-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

insert /*+ APPEND */ into SIP_RM.TB_WTMPS_SESSIONS_ARCHIVE 
select * from TB_WTMPS_SESSIONS_ARCHIVE@SIPRM_OLD where
TWSA_START_DATE >= TO_DATE(dttm_start || '-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWSA_START_DATE <  TO_DATE(dttm_end || '-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;







--TB_WTMPS_ARCHIVE

--��������
/*
select num_rows into numrows_arch from SIP_RM.PART_VIEW where table_name='TB_WTMPS_ARCHIVE' and partition_name=part; --���-�� � �������� ��

    if (numrows_arch > 0)  then
    raise_application_error( -20001, '������ � SIPARCH TB_WTMPS_ARCHIVE:'||part||' ��� �����������' );
    end if;
*/    
    
--DBMS_STATS.GATHER_TABLE_STATS(ownname => 'SIP_W', tabname => 'TB_WTMPS_ARCHIVE', partname => part, cascade => TRUE, ESTIMATE_PERCENT => NULL, granularity => 'PARTITION',DEGREE=>8);
insert /*+ APPEND */ into SIP_RM.TB_WTMPS_ARCHIVE 
select * from TB_WTMPS_ARCHIVE@SIPRM_OLD where
TWH_DATE >= TO_DATE(dttm_start || '-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWH_DATE <  TO_DATE(dttm_start || '-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

insert /*+ APPEND */ into SIP_RM.TB_WTMPS_ARCHIVE 
select * from TB_WTMPS_ARCHIVE@SIPRM_OLD where
TWH_DATE >= TO_DATE(dttm_start || '-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWH_DATE <  TO_DATE(dttm_start || '-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

insert /*+ APPEND */ into SIP_RM.TB_WTMPS_ARCHIVE 
select * from TB_WTMPS_ARCHIVE@SIPRM_OLD where
TWH_DATE >= TO_DATE(dttm_start || '-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWH_DATE <  TO_DATE(dttm_start || '-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

insert /*+ APPEND */ into SIP_RM.TB_WTMPS_ARCHIVE 
select * from TB_WTMPS_ARCHIVE@SIPRM_OLD where
TWH_DATE >= TO_DATE(dttm_start || '-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWH_DATE <  TO_DATE(dttm_end || '-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;





--TB_WTMPS_SESSION_CHARGES
--��������
/*
select num_rows into numrows_arch from SIP_RM.PART_VIEW where table_name='TB_WTMPS_SESSION_CHARGES' and partition_name=part; --���-�� � �������� ��

    if (numrows_arch > 0)  then
    raise_application_error( -20001, '������ � SIPARCH TB_WTMPS_SESSION_CHARGES:'||part||' ��� �����������' );
    end if;
    */
    
--DBMS_STATS.GATHER_TABLE_STATS(ownname => 'SIP_W', tabname => 'TB_WTMPS_SESSION_CHARGES', partname => part, cascade => TRUE, ESTIMATE_PERCENT => NULL, granularity => 'PARTITION',DEGREE=>8);
insert /*+ APPEND */ into SIP_RM.TB_WTMPS_SESSION_CHARGES 
select * from TB_WTMPS_SESSION_CHARGES@SIPRM_OLD where
TWSC_SESSION_DATE >= TO_DATE(dttm_start || '-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWSC_SESSION_DATE <  TO_DATE(dttm_start || '-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

insert /*+ APPEND */ into SIP_RM.TB_WTMPS_SESSION_CHARGES 
select * from TB_WTMPS_SESSION_CHARGES@SIPRM_OLD where
TWSC_SESSION_DATE >= TO_DATE(dttm_start || '-08 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWSC_SESSION_DATE <  TO_DATE(dttm_start || '-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

insert /*+ APPEND */ into SIP_RM.TB_WTMPS_SESSION_CHARGES 
select * from TB_WTMPS_SESSION_CHARGES@SIPRM_OLD where
TWSC_SESSION_DATE >= TO_DATE(dttm_start || '-15 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWSC_SESSION_DATE <  TO_DATE(dttm_start || '-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

insert /*+ APPEND */ into SIP_RM.TB_WTMPS_SESSION_CHARGES
select * from TB_WTMPS_SESSION_CHARGES@SIPRM_OLD where
TWSC_SESSION_DATE >= TO_DATE(dttm_start || '-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')  and  
TWSC_SESSION_DATE <  TO_DATE(dttm_end || '-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN');
commit;

    
    i := i + 1;
     
    EXIT WHEN (i >= j);    -- exit right after --END SYSDATE - 13
    END LOOP;

commit;
execute immediate 'ALTER SESSION CLOSE DATABASE LINK SIPRM_OLD'; --1 ��� ��� 4 ?

dbms_output.put_line('Ended at: '|| TO_CHAR(SYSDATE, 'DD.MM.YYYY HH24:MI:SS'));



        exception
        when ex_custom then dbms_output.put_line( sqlerrm );
        when others then dbms_output.put_line(SQLCODE ||' '|| SUBSTR(SQLERRM, 1, 64));
       

END;
/
