! Program name = integration.f90
! Programmer = Enes Yıldırım 
! Program Version = 23.03.21 Final version (2.0.0)

program integration

! Stage:1 = Declearing variables
  implicit none
  integer:: nm = 100000
  real :: StartPointm, EndPointm, DeltaXm

! Stage:2 = Enter your limits.
  write(*,*)"Enter start point"
  read(*,*) StartPointm
  write(*,*)"Enter final point"
  read(*,*) EndPointm  
  write(*,*)"All x values in between to points which is",StartPointm,"and",EndPointm,"."

! Stage:3 = Calculate DeltaX
  deltaxm = (EndPointm - StartPointm)/real(nm-1)
  write(*,*)"Your deltax is",DeltaXm
 call integ_sub (nm,StartPointm, DeltaXm)
end program integration
