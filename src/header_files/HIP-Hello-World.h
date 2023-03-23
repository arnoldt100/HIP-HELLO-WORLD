#ifndef HIPHELLOWORLD
#define HIPHELLOWORLD

#include <hip/hip_runtime.h>

__global__ void gpuHello()
{
    int thread_id = blockIdx.x*blockDim.x + threadIdx.x;
    printf("From the GPU: Hello World from thread %d\n",thread_id);
    return;
}

int main(int argc, char** argv);

#endif // HIPHELLOWORLD
