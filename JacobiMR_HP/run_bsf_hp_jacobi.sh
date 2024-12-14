#!/bin/bash

# Compilar BSF_HP_Jacobi
mpic++ -fopenmp -o BSF_hp_Jacobi BSF-Code.cpp Problem-bsfCode.cpp Problem-Forwards.h Problem-Data.h

# Ejecutar en bucle de 2 a 64 procesos
for num in {2..64}
do
  echo "Running BSF_Jacobi with $num processes..."
  mpirun -np $num --oversubscribe ./BSF_hp_Jacobi
done
