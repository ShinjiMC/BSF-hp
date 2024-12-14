#!/bin/bash

# Compilar BSF_Gravity
mpic++ -o BSF_Gravity BSF-Code.cpp Problem-bsfCode.cpp Problem-Forwards.h Problem-Data.h

# Ejecutar en bucle de 2 a 64 procesos
for num in {2..64}
do
  echo "Running BSF_Gravity with $num processes..."
  mpirun -np $num --oversubscribe ./BSF_Gravity
done
