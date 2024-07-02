module github.com/BetaLixT/gowebstd/infra/memcache

go 1.19

require (
	github.com/BetaLixT/tsqlx v0.2.0
	github.com/jmoiron/sqlx v1.4.0
	go.uber.org/zap v1.27.0
)

require go.uber.org/multierr v1.10.0 // indirect

replace github.com/BetaLixT/gowebstd v0.0.0 => ../..
