#!/bin/sh

# Variáveis de conexão
DB_HOST="HOST"
DB_PORT="5432"
DB_NAME="postgres"
DB_USER='postgres'
DB_PASSWORD='SENHA'
DB_TESTE="benchmark_test"

COMANDO="DROP DATABASE $DB_TESTE"

# Comando psql para se conectar e executar uma consulta SQL
PGPASSWORD="$DB_PASSWORD" psql -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -U "$DB_USER" -c "$COMANDO"

COMANDO="CREATE DATABASE $DB_TESTE"
PGPASSWORD="$DB_PASSWORD" psql -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -U "$DB_USER" -c "$COMANDO"

#criar estrutura relacional
PGPASSWORD="$DB_PASSWORD" psql -h "$DB_HOST" -p "$DB_PORT" -d "$DB_TESTE" -U "$DB_USER" -f estrutura_relacional.sql

PGPASSWORD="$DB_PASSWORD" pgbench -c 10 -j 2 -T 60 -U "$DB_USER" -d "$DB_TESTE" -h "$DB_HOST" -f teste_carga.sql