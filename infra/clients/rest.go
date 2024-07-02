package clients

import (
	"context"
	"fmt"
	"strconv"
	"time"

	gentr "github.com/BetaLixT/gent-retrier"
	"github.com/BetaLixT/gowebstd/externals/cntxt"
	"github.com/BetaLixT/gowebstd/externals/logger"
	"github.com/Soreing/gent"
	"github.com/Soreing/retrier"
	"go.uber.org/zap"
)

func GetDefaultRetrier() gent.Option {
	return gent.UseRetrier(gentr.NewStatusCodeRetrier(
		5,
		retrier.LinearDelay(100*time.Millisecond),
		[]int{500, 503, 502, 504, 408, 412},
	),
	)
}

func GetRESTTracingMiddleware(
	tracer ITracer,
	lgrf logger.IFactory,
) func(context.Context, *gent.Request) {
	return func(c context.Context, req *gent.Request) {
		lgr := lgrf.Create(c)
		if c == nil {
			err := fmt.Errorf("no context provided")
			lgr.Error("failed to trace", zap.Error(err))
			req.Error(err)
			return
		}

		ctx, ok := c.(cntxt.IContext)
		if !ok {
			err := fmt.Errorf("invalid context")
			lgr.Error("failed to trace", zap.Error(err))
			req.Error(err)
			return
		}

		ver, tid, _, _, flg := ctx.GetTraceInfo()
		sid, err := ctx.GenerateSpanID()
		if err != nil {
			lgr.Error("failed to trace", zap.Error(err))
			req.Error(err)
			return
		}

		req.AddHeader(
			"traceparent",
			fmt.Sprintf("%s-%s-%s-%s", ver, tid, sid, flg),
		)

		start := time.Now()
		req.Next()
		end := time.Now()

		if res := req.GetResponse(); res == nil {
			if len(req.Errors()) == 0 {
				err := fmt.Errorf("response and error nil after request")
				lgr.Error("failed to trace", zap.Error(err))
				req.Error(err)
				return
			}

			tracer.TraceDependency(
				ctx,
				sid,
				"http",
				"", // TODO parse hostname
				fmt.Sprintf("%s %s", req.GetMethod(), req.GetEndpoint()),
				false,
				start,
				end,
				// types.NewField("method", req.Method),
				// types.NewField("error", err.Error()),
				map[string]string{
					"method": req.GetMethod(),
					"error":  req.Errors()[0].Error(),
				},
			)
		} else {
			tracer.TraceDependency(
				ctx,
				sid,
				"http",
				res.Request.URL.Hostname(),
				fmt.Sprintf("%s %s", req.GetMethod(), string(req.GetEndpoint())),
				res.StatusCode > 199 && res.StatusCode < 300,
				start,
				end,
				map[string]string{
					"method":     req.GetMethod(),
					"statusCode": strconv.Itoa(res.StatusCode),
				},
			)
		}
	}
}
