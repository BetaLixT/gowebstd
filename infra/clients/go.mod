module github.com/BetaLixT/gowebstd/infra/clients

go 1.19

require (
	github.com/BetaLixT/gent-retrier v0.0.0-20240117055646-4c2c1d39875b
	github.com/BetaLixT/gowebstd v0.0.0
	github.com/Soreing/gent v0.1.2
	github.com/Soreing/retrier v1.3.0
	go.uber.org/zap v1.24.0
)

require (
	github.com/pkg/errors v0.9.1 // indirect
	go.uber.org/atomic v1.9.0 // indirect
	go.uber.org/multierr v1.8.0 // indirect
)

replace github.com/BetaLixT/gowebstd v0.0.0 => ../..
