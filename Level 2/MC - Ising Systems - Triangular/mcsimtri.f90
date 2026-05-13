program mcsim3lat
    implicit none
    integer, parameter :: L =90 ! Dimension size of the lattice. 
    integer, parameter :: Q = 6
    integer, parameter :: NODE = 100
    integer, parameter :: MCSS = 100000
    integer, parameter :: MCTS = 30000
    integer, parameter :: MCMS = MCSS - MCTS
    integer, parameter :: flipper = -1
    integer :: i,j,k

    real(kind=8), parameter :: JS = 1.0
    real(kind=8), parameter :: kB = 1.0
    real(kind=8), parameter :: TU = 7.1
    real(kind=8), parameter :: TD = 0.01
    real(kind=8), parameter :: DT = (TU - TD)/real(NODE)
    real(kind=8), parameter :: H = 0.0

    real(kind=8) :: T, Tc
    real(kind=8) :: E,energy
    real(kind=8) :: M,magnety


    real(kind=8) :: ri,rj,rs
    integer :: ci,cj,flip
    real (kind=8):: Ei, Ef, Ed, MEST, MESQ, MMST, MMSQ
    real (kind=8):: pB,X,C

    integer::Count
    real(kind=8)::ORIGIN, NO, EA, SE, SO, WE, NW
    integer,dimension(1000)::Seed 
    integer, dimension(L+2,L+2) :: LAT ! Lattice itself.
    
    CHARACTER(LEN=10) :: WDF
    WDF = "(5f24.14)"

    call SYSTEM_CLOCK(Count)
	Seed=Count
	call RANDOM_SEED(Put=Seed)

    !First Creating Lattice and info:
    call mklattice(L,"up",LAT)
    ! Calculate energy : We have six(6) orelation; NO, SO, EA, WE, NW, SE.
    E = energy(L,LAT,H)
    print*, "main : Initial Energy =",E
    M = magnety(L,LAT)
    print*, "main : Initial Magnetization =",M

    ! METROPOLIS ALGORITHM
    MEST = 0.0
    MESQ = 0.0
    MMST = 0.0
    MMSQ = 0.0
    
    do i = 0, NODE
        T = TD + (i*DT)
        print*, "main : Temprature = ", T
        do j = 1,MCSS
            flip = 0
            do k = 1,L**2
                call random_number(ri)
                call random_number(rj)
                ci = INT(L*ri)+2
                cj = INT(L*rj)+2
                
                ORIGIN = LAT(ci,cj)
                NO = LAT(ci-1,cj)
                EA = LAT(ci,cj+1)
                SE = LAT(ci+1,cj+1)
                SO = LAT(ci+1,cj)
                WE = LAT(ci,cj-1)
                NW = LAT(ci-1,cj-1)
                
                Ei = (-1.0*JS)*(ORIGIN*(NO + EA + SE + SO + WE + NW)) - H*ORIGIN 
                Ef = (-1.0*JS)*(flipper*ORIGIN*(NO + EA + SE + SO + WE + NW)) - H*flipper*ORIGIN

                Ed = Ef-Ei                
                pB =  exp((-Ed)/(kB*T))

                if (Ed <= 0) then
                    LAT(ci,cj) = ORIGIN*(-1)
                else
                    call random_number(rs)
                    if (rs < pB) then
                        LAT(ci,cj) = ORIGIN*(-1)
                    end if
                end if

                if (ci==2 .or. ci==L+1 .or. cj==2 .or. cj==L+1) then
                    call updateBoundary(L,LAT)
                end if
                
            end do

            if (j>MCTS) then
                MEST = MEST + energy(L,LAT,H)
                MESQ = MESQ + (energy(L,LAT,H))**2

                MMST = MMST + abs(magnety(L,LAT))
                MMSQ = MMSQ + (magnety(L,LAT))**2
            end if

            
    
        end do  
        
        
        MEST = MEST/real(MCMS)
        MESQ = MESQ/real(MCMS)

        MMST = MMST/real(MCMS)
        MMSQ = MMSQ/real(MCMS)

        X = (L**2)*(MMSQ - MMST**2)/T
		C = (L**2)*((MESQ - MEST**2)/(T**2))
        
		write(24,WDF) T,MMST,MEST,X,C

        MEST = 0.0
        MESQ = 0.0
        MMST = 0.0
        MMSQ = 0.0

        
    end do

end program mcsim3lat

subroutine mklattice(L,conf,LAT)
    implicit none
    integer, intent(in) :: L
    integer, dimension(L+2,L+2), intent(inout) :: LAT
    real(kind=8) :: r
    character(len = 2), intent(in) :: conf
    integer :: i,j
    
    do i = 1, L+2
        do j = 1, L+2
            LAT(i,j) = 3
        end do
    end do

    if (conf == 'up') then 
        do i = 2, L+1
            do j = 2, L+1
                LAT(i,j) = 1
            end do
        end do
    else if (conf == 'do') then 
        do i = 2, L+1
            do j = 2, L+1
                LAT(i,j) = -1
            end do
        end do
    else if (conf == 'ra') then 
        
        do i = 2, L+1
            do j = 2, L+1
                call random_number(r)
                if (r > 0.5) then
                    LAT(i,j) = 1
                else
                    LAT(i,j) = -1
                end if
            end do
        end do
    end if 
    
    ! Corner Baoundaries
    LAT(1,1) = LAT(L+1,L+1)
    LAT(L+2,L+2) = LAT(2,2)
    LAT(1,L+2) = LAT(L+1,2)
    LAT(L+2,1) = LAT(2,L+1)

    ! Column boundaries
    do j = 2,L+1
        LAT(1,j) = LAT(L+1,j)
        LAT(L+2,j) = LAT(2,j)
    end do

    ! Row boundaries
    do i = 2,L+1
        LAT(i,1) = LAT(i,L+1)
        LAT(i,L+2) = LAT(i,2)
    end do


    print*, "mklattice : Lattice has been created. > ",conf


end subroutine

subroutine updateBoundary(L,LAT)
    implicit none
    integer, intent(in) :: L
    integer, dimension(L+2,L+2), intent(inout) :: LAT
    integer :: i,j
    
    ! Corner Baoundaries
    LAT(1,1) = LAT(L+1,L+1)
    LAT(L+2,L+2) = LAT(2,2)
    LAT(1,L+2) = LAT(L+1,2)
    LAT(L+2,1) = LAT(2,L+1)

    ! Column boundaries
    do j = 2,L+1
        LAT(1,j) = LAT(L+1,j)
        LAT(L+2,j) = LAT(2,j)
    end do

    ! Row boundaries
    do i = 2,L+1
        LAT(i,1) = LAT(i,L+1)
        LAT(i,L+2) = LAT(i,2)
    end do

    !print*, "updateBoundary : Boundary spin relation is updated."

end subroutine

function energy(L,LAT,H) result(retE)
    implicit none
    real(kind=8), parameter :: JS=1.0
    real(kind=8), intent(in) :: H
    integer, intent(in) :: L
    integer,dimension(L+2,L+2), intent(in) :: LAT
    real(kind=8) :: retE,retH
    integer :: i,j

    retE = 0.0
    do i = 2,L+1
        do j = 2,L+1
            retE = retE + LAT(i,j)*(LAT(i-1,j)+LAT(i,j+1)+LAT(i+1,j+1)+LAT(i+1,j)+LAT(i,j-1)+LAT(i-1,j-1))
            retH = retH + LAT(i,j)
        end do
    end do

    retE = ((-0.5)*JS*retE - (H*retH))/real(L**2)
    
    
end function energy

function magnety(L,LAT) result(retM)
    implicit none
    integer, intent(in) :: L
    integer,dimension(L+2,L+2), intent(in) :: LAT
    real (kind=8):: retM
    integer:: i,j

    retM = 0.0
    do i = 2,L+1
        do j = 2,L+1
            retM = retM + LAT(i,j)
        end do
    end do

    retM = retM/real(L**2)

end function magnety
