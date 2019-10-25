create or replace function ${STORETW_DUMP_SCHEMA_NAME}.drop_tables()
returns void
language plpgsql
as $$
begin
   EXECUTE
  (SELECT 'drop table '
       || string_agg(quote_ident(schemaname) || '.' || quote_ident(tablename), ', ')
       || ' cascade'
   FROM   pg_tables
   WHERE  schemaname = '${STORETW_DUMP_SCHEMA_NAME}'
   );
end
$$