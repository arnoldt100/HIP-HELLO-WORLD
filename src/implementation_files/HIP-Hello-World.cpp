//============================================================================
// Name        : HIP-Hello-World.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include "HIP-Hello-World.h"
#include "say_hello_cpu.h"
#include <iostream>

int main(int argc, char** argv) {
    say_hello_cpu();

    hipDeviceSynchronize();

    gpuHello<<<1,64>>>();
    hipDeviceSynchronize();

	return 0;
}
