create unlogged table if not exists ${STORETW_SCHEMA_NAME}.station_no_source
(data_source_id                 numeric
,data_source                    text
,station_id                     numeric
,site_id                        text
,organization                   text
,site_type                      text
,huc                            character varying (12)
,governmental_unit_code         character varying (9)
,geom                           geometry(point,4269)
,station_name                   text
,organization_name              text
,description_text               text
,latitude                       numeric
,longitude                      numeric
,map_scale                      text
,geopositioning_method          text
,hdatum_id_code                 text
,elevation_value                text
,elevation_unit                 text
,elevation_method               text
,vdatum_id_code                 text
,station_type_name              text
)
with (fillfactor = 100)
