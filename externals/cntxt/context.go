package cntxt

import "context"

type IContext interface {
	context.Context
	GetTraceInfo() (ver, tid, pid, rid, flg string)
	GenerateSpanID() (string, error)
	WithValue(key any, val any)
}
