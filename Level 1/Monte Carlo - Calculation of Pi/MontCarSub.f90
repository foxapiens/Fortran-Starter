Subroutine Mc_sub (totalstep)
  implicit none
  integer,intent(in) :: totalstep
  integer:: step,insidepoint 
  real::x,y,qcircle,pi,a,b   

    insidepoint=0
  open(unit=1, file='MonteCarloGraphV.txt') ! open unit for txt file
  do step=1,totalstep
  call RandomNumber(x,y)
  a=2*y
  b=2*x
    if (a<sqrt(4.0-b**2)) then  !
      write(1,*) a,b          ! Çemberin eğri kenara kavuşması
      insidepoint=insidepoint+1 
    end if
  end do
  qcircle=real(insidepoint)/real(totalstep)      ! Steps for calculating pi
  pi=4.0*qcircle                                 !
  write(*,*) pi                                  !
  close(unit=1)                                ! Close txt file

end Subroutine Mc_sub 

