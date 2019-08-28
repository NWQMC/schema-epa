#!/bin/bash

# epa schema scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE_EPA}/epa/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${EPA_DATABASE_ADDRESS}:5432/${EPA_DATABASE_NAME} \
	--username=${EPA_SCHEMA_OWNER_USERNAME} \
	--password=${EPA_SCHEMA_OWNER_PASSWORD} \
	--logLevel=debug \
	--liquibaseCatalogName=${WQX_SCHEMA_NAME} \
	--liquibaseSchemaName=${WQX_SCHEMA_NAME} \
	update \
	-DEPA_SCHEMA_OWNER_USERNAME=${EPA_SCHEMA_OWNER_USERNAME} \
	-DWQX_SCHEMA_NAME=${WQX_SCHEMA_NAME} \
	-DWQX_DUMP_SCHEMA_NAME=${WQX_DUMP_SCHEMA_NAME} \
	-DSTORETW_SCHEMA_NAME=${STORETW_SCHEMA_NAME} \
	-DWQP_SCHEMA_OWNER_USERNAME=${WQP_SCHEMA_OWNER_USERNAME}
