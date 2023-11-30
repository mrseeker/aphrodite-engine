#!/bin/bash

set -xe

echo 'Starting Aphrodite Engine API server...'
CMD="python -u -m aphrodite.endpoints.openai.api_server \
             --host 0.0.0.0 \
             --port 7860 \
             --model $MODEL_NAME \
             --api-keys $API_KEY \
             --tensor-parallel-size $NUM_GPUS \
             --dtype $DATATYPE"

if [ -n "$QUANTIZATION" ]; then
    CMD="$CMD --quantization $QUANTIZATION"
fi

exec $CMD