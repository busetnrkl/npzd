MODULE detritus
        use euler
        implicit none
        contains
        SUBROUTINE calc_detritus(t_day,h,theta_minus, a_mix,&
                        l_ZD, z_cur, Z_0,l_PD, p_cur, P_0, l_DN, d_cur, n_cur, S_D_ext,d_next)
                real,intent(in)::t_day, h, theta_minus, a_mix, l_ZD
                real,intent(in)::z_cur, Z_0, l_PD, p_cur, P_0, l_DN
                real,intent(in):: d_cur, n_cur, S_D_ext
                real,intent(out)::d_next
                real::A_mix_calc, func
                A_mix_calc=a_mix*theta_minus
                func=l_ZD*(z_cur-Z_0) + l_PD*(p_cur - P_0) - &
                        l_DN*d_cur - A_mix_calc*(d_cur -n_cur) + S_D_ext
                call calc_euler(d_cur, h, func, d_next)
       END SUBROUTINE calc_detritus
END MODULE detritus
