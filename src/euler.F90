MODULE euler
        implicit none
        contains
                SUBROUTINE calc_euler(y_0,h,func,y_n)
                        real, intent(in):: y_0, h, func
                        real, intent(out):: y_n
                        y_n = y_0 + h*func
                END SUBROUTINE calc_euler
END MODULE euler 
