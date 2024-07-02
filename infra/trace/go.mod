module github.com/BetaLixT/gowebstd/infra/trace

go 1.19

require (
	github.com/BetaLixT/gowebstd v0.0.0
	github.com/Soreing/apex v0.3.1
	github.com/Soreing/motel v0.1.2
	github.com/prometheus/client_golang v1.14.0
	go.opentelemetry.io/otel v1.13.0
	go.opentelemetry.io/otel/exporters/jaeger v1.13.0
	go.opentelemetry.io/otel/sdk v1.13.0
	go.opentelemetry.io/otel/trace v1.13.0
	go.uber.org/zap v1.24.0
)

require (
	code.cloudfoundry.org/clock v1.0.0 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/go-logr/logr v1.2.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/gofrs/uuid v4.2.0+incompatible // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.1 // indirect
	github.com/microsoft/ApplicationInsights-Go v0.4.4 // indirect
	github.com/prometheus/client_model v0.3.0 // indirect
	github.com/prometheus/common v0.37.0 // indirect
	github.com/prometheus/procfs v0.8.0 // indirect
	go.uber.org/atomic v1.9.0 // indirect
	go.uber.org/multierr v1.8.0 // indirect
	golang.org/x/sys v0.8.0 // indirect
	google.golang.org/protobuf v1.30.0 // indirect
)

replace github.com/BetaLixT/gowebstd v0.0.0 => ../..
