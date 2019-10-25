create unlogged table if not exists ${STORETW_SCHEMA_NAME}.project_data_no_source
(data_source_id					smallint
,project_id						numeric
,data_source					character varying (8)
,organization					text
,organization_name				text
,project_identifier				text
,project_name					text
,description					text
,sampling_design_type_code		text
,qapp_approved_indicator		text
,qapp_approval_agency_name		text
);
