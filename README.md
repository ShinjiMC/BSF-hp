# BSF-hp: Bulk Synchronous Farm with Hybrid Parallelism

<div align="center">

![Cplusplus](https://img.shields.io/badge/-C++-blue?logo=cplusplus)
![Build Status](https://img.shields.io/badge/build-passing-77dd77)
[![Commits](https://badgen.net/github/commits/ShinjiMC/BSF-hp/main)]()
![Version](https://img.shields.io/badge/version-1.0.0-b39eb5)
![License](https://img.shields.io/badge/license-MIT-cfcfc4)

</div>

By Braulio Nayap Maldonado Casilla of DEXO Corp.

## Overview

This repository contains the source codes for three parallel implementations using the BSF-skeleton framework in C++:

1. **Jacobi Method Implementation**
   A parallel implementation of the iterative Jacobi method for solving systems of linear algebraic equations using higher-order functions Map and Reduce.

   GitHub Repository: [BSF-Jacobi](https://github.com/leonid-sokolinsky/BSF-Jacobi)

2. **Gravity Problem Implementation**
   A parallel implementation of an iterative algorithm solving a simplified n-body problem, describing how a small body moves under the influence of gravitational forces from large, stationary bodies.

   GitHub Repository: [BSF-Gravity](https://github.com/leonid-sokolinsky/BSF-gravity)

3. **Jacobi Problem with the New BSF-hp**
   A hybrid-parallel implementation of the Jacobi method, combining multi-node parallelization with thread-level parallelism within each node. This approach reduces idle time and improves efficiency, making the computation faster and more scalable.

For detailed documentation on BSF-skeleton, visit its [GitHub repository](https://github.com/leonid-sokolinsky/BSF-skeleton).

## Compilation and Execution

### Jacobi Method

```bash
cd JacobiMR
mpic++ -o BSF_Jacobi BSF-Code.cpp Problem-bsfCode.cpp Problem-Forwards.h Problem-Data.h
```

Run the compiled program with the desired number of nodes:

```bash
mpirun -np <number_of_nodes> ./BSF_Jacobi
```

### Gravity Method

```bash
cd Gravity
mpic++ -o BSF_Gravity BSF-Code.cpp Problem-bsfCode.cpp Problem-Forwards.h Problem-Data.h
```

Run the compiled program with the desired number of nodes:

```bash
mpirun -np <number_of_nodes> ./BSF_Gravity
```

### Jacobi Method with BSF-hp

This implementation introduces hybrid parallelism, utilizing both MPI for multi-node parallelization and OpenMP for thread-level parallelism within each node.

To compile the program:

```bash
cd JacobiMR_HP
mpic++ -fopenmp -o BSF_Jacobi BSF-Code.cpp Problem-bsfCode.cpp Problem-Forwards.h Problem-Data.h
```

Run the compiled program with the desired number of nodes:

```bash
mpirun -np $num ./BSF_Jacobi
```

To enable more threads per node, modify the following line in `Problem-bsfParameters.h`:

```c++
#define PP_BSF_NUM_THREADS 2
```

Adjust the value to match the desired number of threads.

## Customization for Data Size and Output

### Jacobi Method

To modify data size and enable terminal output, edit `Problem-Parameters.h`:

- Increase this value for larger datasets:

  ```c++
  #define PP_N 1500
  ```

- Modify these lines to enable terminal prints:
  ```c++
  // #define PP_MAX_ITER_COUNT 10
  // #define PP_MATRIX_OUTPUT
  #define PP_OUTPUT_LIMIT 0
  ```

### Gravity Method

To modify data size and enable terminal output, edit `Problem-Parameters.h`:

- Increase this value for larger datasets:

  ```c++
  #define PP_NUNBER_OF_LARGE_MASS_POINTS_PER_DIMENSION 500
  ```

- Modify these lines to enable terminal prints:
  ```c++
  // #define PP_LARGE_MASS_POINTS_OUTPUT
  #define PP_OUTPUT_LIMIT 0
  ```

Additionally, edit `Problem-bsfParameters.h` to enable iteration output:

```c++
// #define PP_BSF_ITER_OUTPUT
```

### Jacobi Method with BSF-hp

To customize the hybrid-parallel implementation, edit the following parameters:

- Number of threads:

  ```c++
  #define PP_BSF_NUM_THREADS 2
  ```

- Data size:

  ```c++
  #define PP_N 1500
  ```

- Enable terminal prints:
  ```c++
  // #define PP_MAX_ITER_COUNT 10
  // #define PP_MATRIX_OUTPUT
  #define PP_OUTPUT_LIMIT 0
  ```

## Credits

All credits for the BSF-skeleton and algorithmic implementations go to:

**Leonid B. Sokolinsky**

For more details, refer to the associated paper: [arXiv:2008.03485](https://arxiv.org/abs/2008.03485).
