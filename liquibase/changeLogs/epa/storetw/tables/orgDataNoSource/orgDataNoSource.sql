create unlogged table if not exists ${STORETW_SCHEMA_NAME}.org_data_no_source
(data_source_id                 smallint
,data_source                    character varying (8)
,organization_id                numeric
,organization                   text
,organization_name              text
,organization_description       text
,organization_type              text
);
