module github.com/BetaLixT/gowebstd/infra/redisdb

go 1.19

require (
	github.com/BetaLixT/gotred/v8 v8.0.0-alpha.2
	github.com/go-redis/redis/v8 v8.11.5
)

require (
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	golang.org/x/net v0.10.0 // indirect
	golang.org/x/sys v0.8.0 // indirect
)

replace github.com/BetaLixT/gowebstd v0.0.0 => ../..
