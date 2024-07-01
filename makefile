dogit:
	git add .
	git commit -m "commit"
	git push

postgres:
	docker run --name SimpleBank-postgres -p 5432:5432 -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -d postgres

createmigration:
	migrate create -ext sql -dir db/migration -seq init_schema

.PHONY: dogit postgres createmigrate