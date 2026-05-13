! NEWTON RAHPSON
! Welcome to program NewtonR.f90

! PROGRAM ID
!  Program name : NewtonR.f90
!  Programmer : Enes Yıldırım
!  Program version: v1.0 r : 10.04.2021
!  Program İnfo : The NewtonR.f90 is a program for calculating root of a function.
!                 This program has different parts.

! PROGRAM'S STATES : 1. NewtonR.f90 (Main program)  
!                    2. NewtonR_SubOne.f90 (Subroutine)
!                    3. NewtonR_Fun.f90 (Function)

! 1. NewtonR.f90 Main 
     ! rangeMain : range (main) is a limit value for calculation delta x and after this work,it will send to sub programs. 
     ! StartPoint : Start point valur of function which is defined in program. 
     ! FinalPoint : End point valur of function which is defined in program.
     ! deltax : Delta value is so important in this program because almost every step, the program can use it.
     !          deltax is using for calculation x variables (points).
                      
! 2. NewtonR_SubOne.f90
     ! range_s < intent in > rangeMAin : range (main) is a limit value for calculation delta x and it is limit of the calc step.
     ! StartPoint_s < intent in from > StartPoint : Start point valur of function which is defined in program.
     ! deltax_s < intent in from > deltax : Deltax is using for calculation x variables (points).
     ! i : i is a variable for loops.
     ! OP : OP = Option Parameter is a control variable for if statement which is created for new tolerance value.
     ! F_Prime = Derivative of Function which is entegrated in program.
     ! Tolerance = İt is tolerance for the calculation.
     
! 3. NewtonR_Fun.f90
     ! x : is the dimension of out whole program.
     ! F : is function paramter.

! Default tolerance = 0.000000001 

! 4. Out-Files(txt) : 
     ! X-F(x) : TXT file is an output file for x(out) and F(x)-[out] values.
     ! Fprime : TXT file is an output file for F_prime values.
     ! Roots : TXT file is an output file for root and possible root. (if you want use GNU plot for see the root in xy plane.

! This program is runned for different functions. And it found roots succesfully.
       
! THANK YOU

program NewtonR 
 implicit none
 integer :: rangeMain 
 real :: StartPoint, FinalPoint, deltax
 
 write(*,*) "Enter range of the program."
 read(*,*) rangeMain
 write(*,*) "Enter Start point."
 read (*,*) StartPoint
 write(*,*) "Enter Final point."
 read(*,*)  FinalPoint
 
 deltax = (FinalPoint-StartPoint)/real(rangeMain-1)
 
 call NewtonR_s1 (deltax, StartPoint, rangeMain)
 
end program NewtonR
