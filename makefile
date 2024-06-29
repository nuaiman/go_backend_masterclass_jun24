postgres:
	docker run --name SimpleBank_Postgres -p 5432:5432 -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -d postgres:latest

createdb:
	docker exec -it SimpleBank_Postgres createdb --username=user --owner=user SimpleBank_PostgresDB

dropdb:
	docker exec -it SimpleBank_Postgres dropdb --username=user SimpleBank_PostgresDB

migrateup:
	migrate -path db/migration -database "postgresql://user:password@localhost:5432/SimpleBank_PostgresDB?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://user:password@localhost:5432/SimpleBank_PostgresDB?sslmode=disable" -verbose down

getsqlc:
	go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest			

.PHONY: postgres createdb dropdb migrateup migratedown getsqlc


 