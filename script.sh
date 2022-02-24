docker run \
	--name hoangnv_triton_server \
	--gpus all --shm-size 1g \
	-v ${PWD}/models:/models \
	-v ${PWD}/plugins:/plugins \
	--env LD_PRELOAD=/plugins/libmyplugins.so \
	-p 7500-7502:8000-8002 nvcr.io/nvidia/tritonserver:21.09-py3 tritonserver \
	--model-repository=/models \
	--strict-model-config=false \
	--log-verbose 1
