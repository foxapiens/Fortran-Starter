subroutine derivSub (deltaxs , StartPoints, ns)
integer,intent(in) :: ns
real , intent(in) :: deltaxs , StartPoints
integer :: i
real, dimension (ns) :: x
real :: Functionx, Derivativex

 open (unit=1 ,file='D: X-F(X).txt' , status='Unknown')
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
