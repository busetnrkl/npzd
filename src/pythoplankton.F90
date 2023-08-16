MODULE pythoplankton
        use euler
        implicit none
        contains
        SUBROUTINE calc_pythoplankton(k_N,t_day,r_max,g_max,I_v,l_PN,l_PD,n_cur,p_cur,& 
                        z_cur,h,theta_plus,P_0,p_next)
                real,intent(in)::t_day,r_max,g_max,I_v,l_PN,l_PD,k_N
                real,intent(in)::n_cur,p_cur,z_cur,h,theta_plus,P_0
                real,intent(out)::p_next
                real::R,func
                R=theta_plus*r_max*(n_cur**2/(k_N**2 + n_cur**2))
                func=R*p_cur - theta_plus*g_max* (1-exp(-(I_v**2)* (p_cur**2)))* &
                        z_cur - (l_PN+l_PD)*(p_cur - P_0)
                call calc_euler(p_cur,h,func,p_next)
       END SUBROUTINE calc_pythoplankton
END MODULE pythoplankton

