PROGRAM main

        use euler
        use lengthofday
        use nutrients
        use pythoplankton
        use zooplankton
        use detritus
        

        implicit none
        real:: r_max, k_N, l_PN, l_PD, a_mix, S_N_ext
        real:: g_max, I_v, l_ZN, l_ZD, l_D, S_D_ext, l_DN
        real:: N_0, P_0, Z_0, D_0,h
        real,parameter:: pi=3.14159265,deg=65
        real:: theta_minus, theta_plus
        real:: delta_d, delta_d0, t_day      
        real:: n_cur, p_cur, z_cur, d_cur, lat
        real:: n_next, p_next, z_next, d_next, A_mix_calc
        integer:: end_time, threshday,i 
        character(*),parameter:: filename="/home/buse/npzd/input/parameter.txt"

        open(unit=1,file=filename)
        read(1,*)lat,h,r_max,k_N,l_PN,l_PD,a_mix,N_0,Z_0
        read(1,*)S_N_ext,g_max,I_v,l_ZN,l_ZD,l_D,P_0
        read(1,*)D_0,S_D_ext,l_DN,threshday,end_time
       

        call calc_lengthofday(threshday*1.0,lat,delta_d0)
       
        p_cur=0.01
        n_cur=0.99
        z_cur=0.01
        d_cur=0.99
        do i=1, end_time


        call calc_lengthofday(i*1.0,lat,delta_d)
        if ((delta_d-delta_d0).gt.0) then
                theta_plus=1.0
                theta_minus=0.0
        elseif ((delta_d-delta_d0).le.0) then
                theta_plus=0.0
                theta_minus=1.0
        endif
        write(15,*) i,n_cur,p_cur,z_cur,d_cur
        open(unit=1,file="../output/data.txt")
        write(1,*) i,n_cur,p_cur,z_cur,d_cur
        
        call calc_nutrients(r_max,t_day,k_N,l_PN,l_ZN,l_DN,p_cur, & 
                z_cur,d_cur,n_cur,S_N_ext,a_mix,theta_minus,&
                theta_plus,Z_0,P_0,h,n_next)
        call calc_pythoplankton(k_N,t_day,r_max,g_max,I_v,l_PN,& 
                l_PD,n_cur,p_cur, z_cur,h,theta_plus,P_0,p_next)
        call calc_zooplankton(t_day,g_max,I_v,p_cur,z_cur,l_ZD,&
                l_ZN,h,theta_plus,Z_0,z_next)
        call calc_detritus(t_day,h,theta_minus, a_mix,&
                l_ZD, z_cur, Z_0,l_PD, p_cur, P_0, l_DN, d_cur, n_cur, S_D_ext,d_next)

        
        n_cur=n_next
        p_cur=p_next
        z_cur=z_next
        d_cur=d_next

        end do 
        close(1)
END PROGRAM main
















