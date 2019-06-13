create unlogged table if not exists ${WQX_SCHEMA_NAME}.nemi_wqp_to_epa_crosswalk
(wqp_source                     character varying (6)
,analytical_procedure_source    character varying (256)
,analytical_procedure_id        character varying (256)
,source_method_identifier       character varying (30)
,method_id                      numeric
,method_source                  character varying (20)
,method_type                    character varying (100)
,nemi_url                       text
)
with (fillfactor = 100)
