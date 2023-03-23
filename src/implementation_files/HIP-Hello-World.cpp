//============================================================================
// Name        : HIP-Hello-World.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include "HIP-Hello-World.h"
#include <iostream>

int main(int argc, char** argv) {
    std::cout << "From the CPU: Hello World!!!" << std::endl;
    hipDeviceSynchronize();
    gpuHello<<<1,64>>>();
    hipDeviceSynchronize();

	return 0;
}
