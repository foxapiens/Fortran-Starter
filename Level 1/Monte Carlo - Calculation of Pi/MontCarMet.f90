! This program is created by Enes Yıldırım in April-2021.
! Program can calculates number pi, with monte-carlo teorem.
! Radius of circle = 2.0 [0.0,2.0]

program MontCarMet
 implicit none
  integer::totalstepm             !Declearing variables
                                                    !
  write(*,*) 'Enter totalstep number'               !
  read(*,*) totalstepm
  
  call Mc_sub (totalstepm)                              !
end program MontCarMet
