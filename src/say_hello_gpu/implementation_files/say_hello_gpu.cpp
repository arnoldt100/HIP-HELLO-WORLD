#include "say_hello_gpu.h"

__global__ void say_hello_gpu()
{
    int thread_id = blockIdx.x*blockDim.x + threadIdx.x;
    printf("From the GPU: Hello World from thread %d\n",thread_id);
    return;
}

