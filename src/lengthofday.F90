MODULE lengthofday
        implicit none 
        contains
               SUBROUTINE calc_lengthofday (t_day,lat,del_d)
                       real,intent(in):: t_day
                       real,intent(in)::lat
                       real,intent(out):: del_d
                       real,parameter:: pi=3.14159265
                       real:: gamma_1,w_h,inc
                       w_h = (2*pi)/24
                       gamma_1 = ((2*pi)/365)*(t_day-1)
                       inc=-0.3999*cos(gamma_1)+0.0702*sin(gamma_1)
                       del_d=((2/w_h)*acos(-tan(lat)*tan(inc)))/24
               END SUBROUTINE calc_lengthofday
END MODULE lengthofday
                       
