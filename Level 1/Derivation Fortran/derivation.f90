! WELCOME TO DERIVATION Program

! PROGRAM ID
!   Program name: Derivation.f90
!   Program version : 1.2 (stable)
!   Program release : 10.04.2021
!   Program ability : Program for calculate derivation of a function.
!   Program Subs : 1. File name : derivationsub.f90
!                  1. Sub name : derivSub
!                  2. File name : der_function.f90
!                  2. Functionx(x)

! PROGRAM VARIABLES
!   1. derivative (main program)
!    n : n is range parameter and it useful for creating nodes for the calculation.
!    x : x ise real dimension.
!    StartPoint : Start point valur of function which is defined in program.
!    FinalPoint : End point valur of function which is defined in program.
!    deltax : Delta value is so important in this program because almost every step, the program can use it.
!             deltax is using for calculation x variables (points).
!    OP : control variable of if statements.
!
!   2. Functionx(x)
!    x : x is real variable for function.
!    functionx : function of program.

!   3. derivSub
!    ns <intent in from main > n : n is range parameter and it useful for creating nodes for the calculation.
!    StartPoints < intent in from main > StartPoint : Start point valur of function which is defined in program.
!    deltaxs < intent in from main > : Delta value is so important in this program because almost every step, the program can use it.
!                                      deltax is using for calculation x variables (points).
!    Derivativex : this is our final output and it is derivation ans.
!
!   4. Output (txt) files
!    1. unit = 1 , D: X-F(x).txt :: Output for x and f(x).
!
!   *Thank You!*


program derivative
implicit none

! Stage:1 = Declearing variables
  integer:: n =10000
  real :: x
  real :: deltax,StartPoint,FinalPoint
  integer :: OP
! Stage:2 = Enter data to program. (kullanıcı arayüzü)
  write(*,*)"Hello! I have a notice for you."
  write(*,*)"Program already has a 'n' variable which is node parameter in program."
  write(*,*)"İf you want to enter a new value for n press 2"
  write(*,*)"else press 1."
  read(*,*) OP

     if( OP == 2 ) then
       write(*,*) "Enter new nodes parameter."
       read(*,*) n
     end if

  write(*,*)"Enter start point"
  read(*,*) StartPoint
  write(*,*)"Enter final point"
  read(*,*) FinalPoint
  write(*,*)"All x values in between to points which is",StartPoint,"and",FinalPoint,"."
  write(*,*)"Next stage is calculating derivation for x**2"
! Stage:3 = Calculate delta x.
  deltax = (FinalPoint - StartPoint)/real(n-1)
  write(*,*)"Your deltax is",deltax

  call derivSub ( deltax , StartPoint, n )

end program derivative

subroutine derivSub (deltaxs , StartPoints, ns)
integer,intent(in) :: ns
real , intent(in) :: deltaxs , StartPoints
integer :: i
real, dimension (ns) :: x
real :: Functionx, Derivativex

 open(unit=1 ,file='DX-F(X).txt')
! Stage:4:1 = Calculate derivative with do section.
  do i=1,ns
   x(i) = StartPoints + (i-1)*deltaxs
   write(1,*) x(i),Functionx(x(i))
  end do

! Stage:5 = Calculate derivative
  do i = 1,ns-1
   Derivativex = (Functionx(x(i+1))-(Functionx(x(i))))/(deltaxs)

  end do
 close(unit =1)
  write(*,*) "Derivative of f(x)"
  write(*,5) Derivativex
5 format (f20.2)

end subroutine derivSub

 !fonksiyon kesiti.
real function Functionx(x)
 implicit none
 real :: x
 Functionx = x**2-4*x
end function Functionx
