# Schema migration:
# - GitHub: golang-migrate/migrate: Database migrations. CLI and Golang library.
# - CLI docs: migrate/cmd/migrate at master · golang-migrate/migrate · GitHub
# - Install for your OS, by using (scoop, brew etc)
# - Project root folder / db /migration 
# - Project root folder > migrate create -ext sql -dir db/migration -seq init_schema
# - Copy/paste content of SQL file into migration's up folder
# - Inside migration's down folder, in z-a hierarchy; DROP TABLE IF EXISTS xxxxx; (for all tables)

postgres:
	docker run --name SimpleBank_Postgres -p 5432:5432 -e POSTGRES_USER=$(POSTGRES_USER) -e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) -d postgres:latest

createdb:
	docker exec -it SimpleBank_Postgres createdb --username=$(POSTGRES_USER) --owner=$(POSTGRES_USER) SimpleBank_PostgresDB

dropdb:
	docker exec -it SimpleBank_Postgres dropdb --username=$(POSTGRES_USER) SimpleBank_PostresDB

# (Check) Schema migration

migrateup:
	migrate -path db/migration -database "postgresql://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@localhost:5432/SimpleBank_PostgresDB?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@localhost:5432/SimpleBank_PostgresDB?sslmode=disable" -verbose down

getsqlc:
	go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest			

.PHONY: postgres createdb dropdb migrateup migratedown getsqlc
