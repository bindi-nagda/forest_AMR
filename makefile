CC=mpicc
OBJECTS=poissonFE.o 
CFLAGS=-Wall
LIBS= -lz 

  LIBS +=  /udrive/student/bnagda2015/silo-4.8/lib/libsilo.a -lm
  LIBS += -L$(PETSC_DIR)/$(PETSC_ARCH)/lib -lpetsc
  LIBS += -Wl,-rpath,$(PETSC_DIR)/$(PETSC_ARCH)/lib 
  LIBS += -L/udrive/student/bnagda2015/p4est/local/lib/ -lp4est -lsc

poissonFE: poissonFE.o
	$(CC) $(OBJECTS) -o $@  $(LIBS)

poissonFE.o: poissonFE.c

clean:
	rm -f poissonFE *.o *.pvtu *.vtu *.visit

.PHONY: test-plain test-plain-vtu test-shell test-help clean

clean:
	rm -f poissonFE.o
	rm -f Makelog