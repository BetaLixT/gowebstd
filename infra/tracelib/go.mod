module github.com/BetaLixT/gowebstd/infra/tracelib

go 1.19

require (
	github.com/Soreing/motel v0.1.2
	go.opentelemetry.io/otel v1.13.0
	go.opentelemetry.io/otel/sdk v1.13.0
	go.opentelemetry.io/otel/trace v1.13.0
	go.uber.org/zap v1.24.0
)

require (
	github.com/go-logr/logr v1.2.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/stretchr/testify v1.8.4 // indirect
	go.uber.org/atomic v1.9.0 // indirect
	go.uber.org/multierr v1.8.0 // indirect
	golang.org/x/sys v0.8.0 // indirect
)

replace github.com/BetaLixT/gowebstd v0.0.0 => ../..
