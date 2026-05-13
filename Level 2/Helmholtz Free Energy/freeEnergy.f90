! DATE : 07.12.2023
program homepsiN
    implicit none
    integer, parameter :: node = 100

    real, parameter :: m_up = 1.25
    real, parameter :: m_dn = -1.25
    real, parameter :: m_dm = abs(m_dn-m_up)/node

    real, parameter :: t_up = 5.0
    real, parameter :: t_dn = 0.0
    real, parameter :: t_st = 5.0
    real, parameter :: t_dt = abs(t_dn-t_up)/t_st

    real, parameter :: J = 1.0
    real, parameter :: H = 1.0
    real, parameter :: K = 1.0
    real, parameter :: Q = 4.0

    real :: T, m
    real :: psi_function,psiovern

    integer :: x,y,z

    
    do x = 1, INT(t_st)
        T = t_dn + x*t_dt
        do y = 1,node
            m = m_dn + y*m_dm
            write(x*5+50,*) m,psiovern(J,Q,H,K,T,m)
        end do
        m = m_dn
    end do
end program homepsiN

function psiovern(J,Q,H,K,T,m) result(psi)
    
    real, intent(in) :: J,Q,H,K,T,m
    real :: psi

    psi = -1.0*K*T*((J*Q*m**2)/(2.0*K*T) + H*m - 0.5*((1+m)*(log(1+m))) - 0.5*((1-m)*(log(1-m))))

    
end function psiovern
