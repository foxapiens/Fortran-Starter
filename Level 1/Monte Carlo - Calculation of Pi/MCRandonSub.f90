! Random Number Creator.
Subroutine RandomNumber (x,y)
 implicit none
 real,intent(inout)::x,y
  call random_number(y)         ! Creating a random number for y value
  call random_number(x)         ! Creating a random number for x value
  
end subroutine RandomNumber
 
 
