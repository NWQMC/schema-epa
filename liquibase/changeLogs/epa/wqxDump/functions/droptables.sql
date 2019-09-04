create or replace function wqx_dump.drop_tables()
returns void
language plpgsql
as $$
begin
   EXECUTE
  (SELECT 'drop table '
       || string_agg(quote_ident(schemaname) || '.' || quote_ident(tablename), ', ')
       || ' cascade'
   FROM   pg_tables
   WHERE  schemaname = 'wqx_dump'
   );
end
$$