FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-devel

##############################################################################
# Temporary Installation Directory
##############################################################################
ENV STAGE_DIR=/app
ENV TORCH_CUDA_ARCH_LIST="8.0 8.6 8.9 9.0+PTX"
RUN mkdir -p ${STAGE_DIR}

##############################################################################
# Requirements
##############################################################################
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/                                                                                repos/ubuntu1804/x86_64/3bf863cc.pub

RUN apt-get update && apt-get -y dist-upgrade && apt-get -y upgrade && \
        apt-get install -y --no-install-recommends \
        libsndfile-dev \
        git \
        git-lfs

RUN pip install ninja \
        psutil \
        ray==2.5.1 \
        sentencepiece \
        numpy \
        transformers==4.34.0 \
        uvicorn \
        openai \
        xformers==0.0.22 \
        fschat==0.2.23 \
        pydantic==1.10.13 \
        pyarrow \
        pandas \
        fastapi \
        colorlog

##############################################################################
# Install package
##############################################################################

RUN git clone https://github.com/mrseeker/aphrodite-engine.git ${STAGE_DIR}/aphrodite-engine
RUN cd ${STAGE_DIR}/aphrodite-engine && \
        git checkout . && \
#        git checkout tags/v0.12.3 && \
        git checkout main && \
        pip install -e .
#RUN rm -rf ${STAGE_DIR}/aphrodite-engine
RUN python -c "import aphrodite; print(aphrodite.__version__)"

##############################################################################
# Finishing touches
##############################################################################

WORKDIR /app/aphrodite-engine