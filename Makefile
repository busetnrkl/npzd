.PHONY: clean

main.exe: euler.mod nutrients.mod phytoplankton.mod detritus.mod zooplankton.mod lengthofday.mod euler.o nutrients.o phytoplankton.o detritus.o zooplankton.o lengthofday.o main.o
	        gfortran euler.o nutrients.o phytoplankton.o detritus.o zooplankton.o lengthofday.o main.o -o main.exe

euler.mod : euler.F90
	        gfortran -c euler.F90
nutrients.mod : nutrients.F90
	        gfortran -c nutrients.F90
phytoplankton.mod : phytoplankton.F90
	        gfortran -c phytoplankton.F90
detritus.mod : detritus.F90
	        gfortran -c detritus.F90
zooplankton.mod : zooplankton.F90
	        gfortran -c zooplankton.F90
lengthofday.mod : lengthofday.F90
	        gfortran -c lengthofday.F90
main.o : main.F90
	        gfortran -c main.F90
euler.o : euler.F90
	        gfortran -c euler.F90
nutrients.o : nutrients.F90
	        gfortran -c nutrients.F90
phytoplankton.o : phytoplankton.F90
	        gfortran -c phytoplankton.F90
detritus.o : detritus.F90
	        gfortran -c detritus.F90
zooplankton.o : zooplankton.F90
	        gfortran -c zooplankton.F90
lengthofday.o : lengthofday.F90
	        gfortran -c lengthofday.F90

clean :
	        rm -rf *mod *o *exe
