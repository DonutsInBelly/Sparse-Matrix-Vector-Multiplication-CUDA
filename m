CC = /usr/local/cuda-7.5/bin/nvcc
objects = mmio.o
?= /usr/local/cuda-7.5
NVCC := $(CUDA_PATH)/bin/nvcc

all: $(objects)
	$(CC) -arch=sm_30 $(objects) -o spmv

%.o: %.c
	$(CC) -x cu -arch=sm_20 -I. -dc $< -o $@

clean:
	rm -f *.o spmv
