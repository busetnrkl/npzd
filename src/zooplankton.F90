MODULE zooplankton
        use euler
        implicit none
        contains
        SUBROUTINE calc_zooplankton(t_day,g_max,I_v,p_cur,z_cur,l_ZD, &
                        l_ZN,h,theta_plus,Z_0,z_next)
                real,intent(in)::t_day,g_max,I_v,p_cur,z_cur,theta_plus
                real,intent(in)::l_ZD,l_ZN,h,Z_0
                real,intent(out)::z_next
                real::func
                func = theta_plus * g_max * (1-exp((-I_v**2)*(p_cur**2)))* &
                        z_cur - (l_ZD + l_ZN)*(z_cur - Z_0)
                call calc_euler(z_cur,h,func,z_next)
       END SUBROUTINE calc_zooplankton
END MODULE zooplankton
                
