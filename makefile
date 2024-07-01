gitpush:
	git add .
	git commit -m "commit"
	git push

postgres:
	docker run --name SimpleBank-postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres

createmigration:
	migrate create -ext sql -dir db/migration -seq init_schema

createdb:
	docker exec -it SimpleBank-postgres createdb --username=root --owner=root SimpleBank-DB

dropdb:
	docker exec -it SimpleBank-postgres dropdb SimpleBank-DB

migrateup:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/SimpleBank-DB?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/SimpleBank-DB?sslmode=disable" -verbose down

.PHONY: gitpush postgres createmigrate createdb dropdb migrateup