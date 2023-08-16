MODULE nutrients
        use euler
        implicit none
        contains
               SUBROUTINE calc_nutrients(r_max,t_day,k_N,l_PN,l_ZN,l_DN,p_cur, &
                       z_cur,d_cur,n_cur,S_N_ext,a_mix,theta_minus, theta_plus,Z_0,P_0, &
                       h,n_next)
                        real,intent(in)::r_max,t_day,k_N,l_PN,l_DN,l_ZN,Z_0,P_0,theta_minus, theta_plus
                        real,intent(in)::n_cur,p_cur,z_cur,d_cur,S_N_ext,a_mix,h
                        real,intent(out)::n_next
                        real::A_mix_calc,R,func
                        A_mix_calc=a_mix*theta_minus
                        R=theta_plus*r_max*(n_cur**2/ (k_N**2 + n_cur**2))
                        func=-R*p_cur + l_PN*(p_cur-P_0) + l_ZN*(z_cur - Z_0) + &
                                l_DN*d_cur + A_mix_calc*(d_cur - n_cur) + S_N_ext
                        call calc_euler(n_cur,h,func,n_next)
                END SUBROUTINE calc_nutrients
END MODULE nutrients


                        
                        


