package clients

import (
	"context"
	"time"
)

type ITracer interface {
	ExtractTraceInfo(
		ctx context.Context,
	) (ver, tid, pid, rid, flg string)
	TraceDependency(
		ctx context.Context,
		spanID string,
		dependencyType string,
		serviceName string,
		commandName string,
		success bool,
		startTimestamp time.Time,
		eventTimestamp time.Time,
		fields map[string]string,
	)
}
