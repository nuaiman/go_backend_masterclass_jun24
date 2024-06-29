package main

import (
	"fmt"

	_ "github.com/jackc/pgx/v5"
)

func main() {
	fmt.Println("Hello, World!")
}

// version: "2"
// sql:
//   - engine: "postgresql"
//     queries: "query.sql"
//     schema: "schema.sql"
//     gen:
//       go:
//         package: "tutorial"
//         out: "tutorial"
//         sql_package: "pgx/v5"
