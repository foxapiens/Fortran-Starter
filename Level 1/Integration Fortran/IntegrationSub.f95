Subroutine integ_sub (n,StartPoint, DeltaX)
 implicit none 
 integer,intent(in) :: n
 integer:: i
 real, dimension (n) :: x, y, BirimAlan
 real,intent(in) :: StartPoint, DeltaX
 real :: functionx, AreaSum
 ! Stage:4 = Calculate X parts and Y parts
  open(unit=1 , file='data.txt')
  AreaSum = 0.0
  
  do i = 1,n
     x(i) = StartPoint + (i-1)*DeltaX
     y(i) = functionx(x(i))
     BirimAlan(i) = y(i)*Deltax 
     AreaSum = AreaSum + BirimAlan(i)
     write(1,*) x(i) , y(i), AreaSum
  end do
  
  write(*,*) "Your integration value ="
  write(*,5) AreaSum
  5 format (f10.4)
 close(unit=1)
end subroutine integ_sub
