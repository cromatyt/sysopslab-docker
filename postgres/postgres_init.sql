CREATE USER keycloak WITH PASSWORD 'keycloak' CREATEDB;
CREATE DATABASE keycloak
    WITH
    OWNER = keycloak
    ENCODING = 'UTF8'
    LC_COLLATE = 'fr_FR.utf8'
    LC_CTYPE = 'fr_FR.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

    \connect keycloak;
    CREATE SCHEMA IF NOT EXISTS keycloak AUTHORIZATION keycloak;

CREATE USER gitea WITH PASSWORD 'gitea' CREATEDB;
CREATE DATABASE gitea
    WITH
    OWNER = gitea
    ENCODING = 'UTF8'
    LC_COLLATE = 'fr_FR.utf8'
    LC_CTYPE = 'fr_FR.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

    \connect gitea;
    CREATE SCHEMA IF NOT EXISTS gitea AUTHORIZATION gitea;