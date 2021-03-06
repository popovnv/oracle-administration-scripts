SELECT ksppinm                                                                                name,
       LOWER(LTRIM(ksppinm, '_'))                                                             sort_name,
       ksppity                                                                                ptype,
       ksppstvl                                                                               value,
       DECODE(ksppstdf, 'TRUE', 1, 0)                                                         isdefault,
       DECODE(BITAND(ksppiflg/256, 1), 1, 1, 0)                                               isses_modifiable,
       DECODE(BITAND(ksppiflg/65536, 3), 1, 1, 2, 2, 3, 1, 0)                                 issys_modifiable,
       DECODE(BITAND(ksppstvf, 7), 1, 1, 4, 2, 0)                                             is_modified,
       DECODE(BITAND(ksppstvf, 2), 2, 1, 0)                                                   is_adjusted,
       ksppdesc                                                                               description,
       DECODE(SUBSTR(ksppinm, 1, 1), '_', 1, 0)                                               is_hidden
  FROM x$ksppi x, x$ksppcv y
 WHERE x.indx = y.indx
   AND x.INST_ID = USERENV('INSTANCE')
   AND y.INST_ID = USERENV('INSTANCE')
 UNION ALL
SELECT 'log_mode'                                       name,
       'log_mode'                                       sort_name,
       2                                                ptype,
       TO_CHAR(DECODE(log_mode, 'ARCHIVELOG', 1, 0))    value,
       1                                                isdefault,
       0                                                isses_modifiable,
       0                                                issys_modifiable,
       0                                                is_modified,
       0                                                is_adjusted,
       'ARCHIVELOG_DESC'                                description,
       0                                                is_hidden
  FROM v$database
 ORDER BY 2
