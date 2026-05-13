program critical_point
    implicit none

    character(len=10) :: RDF
    integer, parameter :: node = 100
    integer :: i,j,max_step

    real, dimension(node) :: T, M, Maim, E,Eaim, X,Xaim, C,Caim
    real :: temp,aim,mtc,etc,xtc,ctc,mcv,ecv,xcv,ccv,Tc
    integer :: mpo,epo,xpo,cpo

	RDF = "(5f24.14)"


   


    open(30, file="fort.24")
    do i = 1,node
        read(30,RDF) T(i), M(i), E(i), X(i), C(i)
    end do
    close(30)
    


    Maim(1) = 0.0
    Eaim(1) = 0.0
    Xaim(1) = 0.0
    Caim(1) = 0.0

    ! Tc according to magnetism.
    do i = 1, node
        if (i > 1) then 
            ! türev
            Maim(i) = (M(i)-M(i-1))/(T(i)-T(i-1))            
            Eaim(i) = (E(i)-E(i-1))/(T(i)-T(i-1))
            Xaim(i) = (X(i)-X(i-1))/(T(i)-T(i-1))
            Caim(i) = (C(i)-C(i-1))/(T(i)-T(i-1))       
        end if     
    end do

    
    mpo = findloc(Maim,minval(Maim),1)
      
    mtc = (T(mpo-1)+T(mpo)+T(mpo+1))/3.0
    mcv = M(mpo)
    
    epo = findloc(Eaim,maxval(Eaim),1)
    etc = (T(epo-1)+T(epo)+T(epo+1))/3.0
    ecv = E(epo)

    xpo = findloc(Xaim,minval(Xaim),1)
    xtc = (T(xpo-1)+T(xpo)+T(xpo+1))/3.0
    xcv = X(xpo)
    
    cpo = findloc(Caim,minval(Caim),1) 
    ctc = (T(cpo-1)+T(cpo)+T(cpo+1))/3.0
    ccv = C(cpo)    
    
    Tc = (mtc + etc + xtc + ctc)/4.0  
    
    
    print*, "P | Critical Value | Critical Temprature"
    print*, "_________________________________________________"
    write(*,*) "M",mcv,mtc  
    write(*,*) "E",ecv,etc
    write(*,*) "X",xcv,xtc
    write(*,*) "C",ccv,ctc
    print*, "_________________________________________________"
    write(*,*) "Tc = ",Tc

    do i = 1,node
        write(40,*) T(i), Maim(i), Eaim(i), Xaim(i), Caim(i)
    end do
    
end program critical_point
