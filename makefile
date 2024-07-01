postgres:
	docker run --name SimpleBank-postgres -p 5432:5432 -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -d postgres

.PHONY: postgres