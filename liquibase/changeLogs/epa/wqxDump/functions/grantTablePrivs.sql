create or replace function ${WQX_DUMP_SCHEMA_NAME}.grant_table_privs()
returns void
language plpgsql
as $$
begin
   EXECUTE
  (SELECT 'grant select on '
       || string_agg(quote_ident(schemaname) || '.' || quote_ident(tablename), ', ')
       || ' to wqp_core'
   FROM   pg_tables
   WHERE  schemaname = '${WQX_DUMP_SCHEMA_NAME}'
   );
end
$$