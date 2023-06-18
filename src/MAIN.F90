program MAIN
    use DIRMAX_MODULE  ! This includes the DIRMAX function
    IMPLICIT NONE
    DOUBLE PRECISION G(3), Z(3), TD, ALT, B
    INTEGER DOY
    INTEGER i

    DO i = 1, 3
        G(i) = i * 100.0
        Z(i) = i * 0.1
    END DO

    TD = 20.0
    DOY = 150.0
    ALT = 500.0

    B = DIRMAX(G, Z, TD, DOY, ALT)

    PRINT *, 'The beam irradiance B is: ', B
end program MAIN