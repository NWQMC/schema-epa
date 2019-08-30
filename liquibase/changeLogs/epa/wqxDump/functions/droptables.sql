create or replace function wqx_dump.drop_tables()
returns void
language plpgsql
as $$
begin
   raise notice '%', 
   execute (select 'drop table ' string_agg(quote_ident(schemaname) || '.' || quote_ident(tablename), ', ') || ' cascade'
              from pg_tables
             where schemaname = 'wqx_dump');
end
$$