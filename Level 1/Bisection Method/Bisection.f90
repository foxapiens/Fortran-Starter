

! WELCOME TO BISECTION METHOD PROGRAM
! That file is just an base program for (main.f90) for BisectionSub.f90
  !and BisectionFunc.f90.
! This is second version (2.0) of the program BisectionMethod.f90.
! Program "Bisection.f90","BisectionSub.f90" and BisectionFunc.f90 is made by Enes Yıldırım.
! 10.04.2021

! Program ID :
! This program contains two different sub programs.
! A. Main program, Bisection.
! 1. Subroutine, BisectionSub.
! 2. Function, g(x).

! PROGRAM RUN STATEMENTS : Main program > Subroutine > Function.
                         ! Because of that design, I used intent(inout) code.

! PROGRAM VARIABLES:
  ! val_OP : (value of option) : This variable is crated for management of if statements.
  ! point1, point_1, point2, point_2 (not: '_' is about 'Sub') : These are just variables for x axis.
  ! valtol, val_tol : These are tolerance values of the program Bisection.f90.
  ! g(x) : This is our founction. x**3 -x -2.0.
  ! point_mid : That variable is the most important variable of program Bisection.f90.
  !             point_mid is an intent(in) variable and at the same time an intent(out)
  !             number like  point_1 and point_2.

  !ADDITIONALY : There are some control lines which are
  ! "Your function is between :",point1,"and",point2."
  ! "Subroutine is working..."

program Bisection
 implicit none
 integer:: val_OP
 real :: point1, point2,valtol
  valtol = 0.0001
  write(*,*) "Program already has a tolerance value which is 0.0001"
  write(*,*) "If you want to enter your own tolerance value then press 2 ","If you not then press any number"
  read(*,*) val_OP
  if (val_OP == 2) then
  write(*,*) "Enter a tolerans value for calculation."
  read(*,*) valtol
  end if
  write(*,*) "Enter first point value."
  read(*,*) point1
  write(*,*) "Enter  end point value."
  read(*,*) point2
  write(*,*) "Your function is between :",point1,"and",point2

  call BisectionSub (point1,point2,valtol)

end program Bisection

real function g(x)
 implicit none
 real :: x
 real,parameter:: e= 2.71
 g =sin(x)-e**(x)
end function g

Subroutine BisectionSub (point_1,point_2,val_tol)
 implicit none
  real, intent(inout) :: point_1, point_2,val_tol
  integer :: val_do,do_range
  real ::point_mid,g
  write(*,*) "Subroutine is working..."

  do_range = 10000

  do val_do = 1,do_range
    point_mid = (point_1+point_2)/2.0
     if (g(point_mid)*g(point_1) < 0.0) then
        point_2 = point_mid
        !print*, point_1 !control line.
     else if (g(point_mid)*g(point_1) > 0.0) then
        point_1 = point_mid
        !print*, point_1 !control line.
     else if (g(point_mid) > (-val_tol) .and. g(point_mid) < val_tol) then
        write(*,*) "The root is :",point_mid,"with tolerance:",val_tol
        Exit
     else
        write(*,*) "Oops!,Something wrong here. Please enter your values again."
     end if
  end do

end subroutine BisectionSub


