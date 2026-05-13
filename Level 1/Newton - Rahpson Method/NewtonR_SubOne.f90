subroutine NewtonR_s1 (deltax_s , StartPoint_s, range_s)
integer,intent(in) :: range_s
real , intent(in) :: deltax_s , StartPoint_s
integer :: i,OP
real, dimension (range_s) :: x,F_prime
real :: F,tolerance
  
  tolerance = 0.000000001
  open(unit= 1 , file ='X-F(x).txt')
  open(unit= 2 , file ='F(x)prime.txt')
  open(unit= 3 , file ='Roots.txt')
  write (*,*) "Program already has a tolerance value."
  write (*,*) "But If you want to add a new one then press 2.","If you don't then enter any number."
  read(*,*) OP
  if (OP == 2) then
  read(*,*) tolerance
  end if


  do i=1,range_s
    x(i) = StartPoint_s + (i-1)*deltax_s
    write(1,*) x(i),F(x(i))
  end do 

  do i = 1,range_s-1
     F_prime(i) = (F(x(i+1))-(F(x(i))))/(deltax_s)
     write(2,*) F_prime(i)
  	 
  end do
    
   do i = 1, range_s     
   
   if (i+1 > range_s) Exit
      
      x(i+1) = x(i)-(F(x(i))/F_prime(i))
      if (x(i+1)-x(i) < tolerance) then 
      write(*,*) "Possible root:",i,"=",x(i+1)
      write(3,*) x(i+1)
      end if
      if (x(i+1)-x(i) == 0.) then
      write(*,*) "That is 99% your function' s root", x(i+1)     	
      write(3,*) x(i+1)     	
      Exit
      end if
 
   end do 
   
   close(unit=1)
   close(unit=2)
   close(unit=3)
   
end subroutine NewtonR_s1
