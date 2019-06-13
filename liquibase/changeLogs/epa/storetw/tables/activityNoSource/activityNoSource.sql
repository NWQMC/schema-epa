create unlogged table if not exists ${STORETW_SCHEMA_NAME}.activity_no_source
(data_source_id                 numeric
,data_source                    text
,station_id                     numeric
,site_id                        text
,event_date                     date
,analytical_method              text
,p_code                         text
,activity                       text
,characteristic_name            text
,characteristic_type            text
,sample_media                   text
,organization                   text
,site_type                      text
,huc                            character varying (12)
,governmental_unit_code         character varying (9)
,organization_name              text
,activity_id                    numeric
,activity_type_code             text
,activity_media_subdiv_name     text
,activity_start_time            text
,act_start_time_zone            text
,activity_stop_date             text
,activity_stop_time             text
,act_stop_time_zone             text
,activity_depth                 text
,activity_depth_unit            text
,activity_depth_ref_point       text
,activity_upper_depth           text
,activity_upper_depth_unit      text
,activity_lower_depth           text
,activity_lower_depth_unit      text
,project_id                     text
,activity_conducting_org        text
,activity_comment               text
,sample_aqfr_name               text
,hydrologic_condition_name      text
,hydrologic_event_name          text
,sample_collect_method_id       text
,sample_collect_method_ctx      text
,sample_collect_method_name     text
,sample_collect_equip_name      text
)
with (fillfactor = 100)
