# sample script for creating a generated liquibase changeLog.yml file
# 
${LIQUIBASE_HOME}/liquibase --driver=org.postgresql.Driver \
      --classpath=${JAR_LOCATION}/postgresql-42.2.5.jar \
      --changeLogFile=${CHANGELOG_LOCATION}/changeLog.yml \
      --url="jdbc:postgresql://${DATABASE_HOST}:5432/${DATABASE_NAME}?currentSchema=${SCHEMA_TO_USE}" \
      --username=postgres \
      --password=${POSTGRES_PASSWORD} \
      generateChangeLog
#
# {LIQUIBASE_HOME} = The directory containing the liquibase install
# ${JAR_LOCATION} = The directory containing the postgesql jdbc jar
# ${CHANGELOG_LOCATION} = The directory to place the generated changeLog.yml file - it can be in the correct project repository location
# ${DATABASE_HOST} = The host name of the database
# ${DATABASE_NAME} = The name of the database you wish to connect to
# ${SCHEMA_TO_USE} = The schema for which the changeLog should be generated for
# ${POSTGRES_PASSWORD} = password of the database's postgres user
#
#
# Once generated, the changeLog.yml will need two modifications:
#   1) Add '- objectQuotingStrategy: QUOTE_ALL_OBJECTS' (without the quotes) between 'databaseChangeLog:' and the first '- changeSet:'
#        This is only needed if the database objects were created with mixed case or uppercase names.
#   2) add '        schemaName: ${STORETW_DUMP_SCHEMA_NAME}' (with the correct environment variable name) after each '       tableName:' entry
#        This guarantees the objects are created in the correct schema.
#