#include "HIP-Hello-World.h"
#include "say_hello_cpu.h"
#include "say_hello_gpu.h"

int main(int argc, char** argv)
{

    say_hello_cpu();

    say_hello_gpu<<<1,64>>>();

    hipDeviceSynchronize();

	return 0;
}
