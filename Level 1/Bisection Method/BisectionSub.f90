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
