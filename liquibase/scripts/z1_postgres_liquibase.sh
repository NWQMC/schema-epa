#!/bin/bash
#!/bin/bash
# The set -e tells bash to exit immediately if a simple command fails.
# The set -o pipefail tells bash to set pipeline's return status to status of the last (rightmost) command.
# Both should be used in scripts meant to be called by Jenkins or another job runner.
set -e
set -o pipefail

# postgres to postgres db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE_EPA}/postgres/postgres/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${EPA_DATABASE_ADDRESS}:5432/postgres \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--logLevel=debug \
	--liquibaseCatalogName=public \
	--liquibaseSchemaName=public \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DEPA_DATABASE_NAME=${EPA_DATABASE_NAME} \
	-DEPA_DB_OWNER_USERNAME=${EPA_DB_OWNER_USERNAME} \
	-DEPA_DB_OWNER_PASSWORD=${EPA_DB_OWNER_PASSWORD} \
	-DEPA_SCHEMA_OWNER_USERNAME=${EPA_SCHEMA_OWNER_USERNAME} \
	-DEPA_SCHEMA_OWNER_PASSWORD=${EPA_SCHEMA_OWNER_PASSWORD} \
	-DWQX_SCHEMA_NAME=${WQX_SCHEMA_NAME} \
	-DSTORETW_SCHEMA_NAME=${STORETW_SCHEMA_NAME} \
	-DWQP_SCHEMA_NAME=${WQP_SCHEMA_NAME} \
	-DWQX_DUMP_SCHEMA_NAME=${WQX_DUMP_SCHEMA_NAME} \
	-DSTORETW_DUMP_SCHEMA_NAME=${STORETW_DUMP_SCHEMA_NAME} \
	-DWQP_SCHEMA_OWNER_USERNAME=${WQP_SCHEMA_OWNER_USERNAME} \
	-DWQP_SCHEMA_OWNER_PASSWORD=${WQP_SCHEMA_OWNER_PASSWORD}

# postgres to epa db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE_EPA}/postgres/epa/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${EPA_DATABASE_ADDRESS}:5432/${EPA_DATABASE_NAME} \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--logLevel=debug \
	--liquibaseCatalogName=public \
	--liquibaseSchemaName=public \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DEPA_SCHEMA_OWNER_USERNAME=${EPA_SCHEMA_OWNER_USERNAME} \
	-DWQX_SCHEMA_NAME=${WQX_SCHEMA_NAME} \
	-DWQX_DUMP_SCHEMA_NAME=${WQX_DUMP_SCHEMA_NAME} \
	-DSTORETW_SCHEMA_NAME=${STORETW_SCHEMA_NAME}\
	-DSTORETW_DUMP_SCHEMA_NAME=${STORETW_DUMP_SCHEMA_NAME}\
	-DNWIS_SCHEMA_NAME=${NWIS_SCHEMA_NAME}
	