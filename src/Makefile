FC=gfortran
SRC=euler.F90 lengthofday.F90 nutrients.F90 pythoplankton.F90 zooplankton.F90 detritus.F90 main.F90
OBJ=${SRC:.f90=.o}


%.o: %.f90
	$(FC) -o $@ -c $<

main: $(OBJ)
	$(FC) -o $@ $(OBJ) 

clean: #cleans all the old compilation files
	@rm -f *.mod *.o maths
