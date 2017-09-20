set serveroutput on size 1000000
exec DBMS_OUTPUT.ENABLE(1000000);
set serveroutput on

BEGIN
  FOR item IN (
   --select SID sd,SERIAL# ss from v$session where machine in ('Radius1','Radius2')
   --select SID sd,SERIAL# ss from v$session where username = ('SIP_IBS')
    select SID sd,SERIAL# ss from v$session where MACHINE like 'rad-smr-srv%'
  )
  LOOP
    --execute immediate 'Alter System Kill Session '''|| item.sd || ',' || item.ss || ''' IMMEDIATE';
    DBMS_OUTPUT.PUT_LINE      ('Alter System Kill Session '''|| item.sd || ',' || item.ss || ''' IMMEDIATE;');
       
  END LOOP;
END;
/
