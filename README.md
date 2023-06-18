# DIRMAX by Richard Perez

## Abstract
 The [dynamic global-to-direct irradiance conversion model](http://asrc.albany.edu/people/faculty/perez/publications/Solar%20Resource%20Assessment%20and%20Modeling/More%20Papers%20on%20Resource%20Assessment%20and%20Satellites/dynamic%20global-direct%20irradiance%20conversion%20model-92.pdf) by [Richard Perez](http://www.asrc.albany.edu/people/faculty/perez/)  is frequently referenced. The difficulty of referencing its original FORTRAN code has increased. 
 It is also difficult to compile directly with current FORTRAN compilers.
Therefore, I have developed a new FORTRAN code that is faithful to the original code as much as possible, but with a minimum of modifications.
The code can be compiled with GFORTRAN.

## Function Description

 The function dirmax uses a disc beam model to calculate the beam irradiance returned. 
The argument G is an array of 3 values. The values are the global irradiance of the previous reading, 
the current reading, and the next reading in that order. The argument Z uses the same format,
except the values are the respective solar zenith angles. If any of the G or Z values are not 
available or the previous or next readings did not occur within 1.5 hours of the current reading then the appropriate value or values should be replaced with a -999.0.
If the argument TD is missing then the value -999.0 should be used in place of the missing argument.
 The current global irradiance (G(2)) must have a value. If the dew point temperature (TD)
is missing then id is not used to find an index into the correction matrix (CM), instead a special column
in the matrix is usedd. If the previous global irradiance (G(1)) or solar zenith angle (Z(1)) 
and the next global irradiance (G(3)) or solar zenith angle (Z(3)) are missing
then delta kt' (dtk1) is not used to find an index into the correction matrix (CM),
instead a special column in the matrix is used.

## File placement

- origin/DIRMAX.F77 Original Fortran77 code
- src/DIRMAX.F90 Code modified to compile with Gfotran
- src/MAIN.F90 Sample main function

## How it works

```
$ gfortran src/DIRMAX.F90 src/MAIN.F90 -o main
$ . /main
 The beam irradiance B is: 9.0164700151757060
```


*Read this in other languages: [English](README.md), [日本語](README.ja.md).*

## Original description
Below is the original description.
<PRE>
FUNCTION NAME:    DIRMAX
PROGRAMMED BY:    HOWARD M. BISNER
ARGUMENTS: G(3) - GLOBAL IRRADIANCE (WATTS / SQ. METER)
           Z(3) - SOLAR ZENITH ANGLE (RADIANS)
             TD - DEW POINT TEMPERATURE ( DEGREES C)
            DOY - JULIAN DAY OF YEAR
            ALT - ALTITUDE OF SITE (METERS)
RETURNS:      B - BEAM IRRADIANCE (WATTS / SQ. METER)
NOTES:            THE FUNCTION DIRMAX USES A DISC BEAM MODEL TO
                  CALCULATE THE BEAM IRRADIANCE RETURNED. THE
                  ARGUMENT G IS AN ARRAY OF 3 VALUES. THE VALUES 
                  ARE THE GLOBAL IRRADIANCE OF THE PREVIOUS READING,
                  THE CURRENT READING ,AND THE NEXT READING IN THAT
                  ORDER. THE ARGUMENT Z USES THE SAME FORMAT, EXCEPT
                  THE VALUES ARE THE RESPECTIVE SOLAR ZENITH ANGLES.
                  IF ANY OF THE G OR Z VALUES ARE NOT AVAILABLE OR THE
                  PREVIOUS OR NEXT READINGS DID NOT OCCUR WITHIN 1.5
                  HOURS OF THE CURRENT READING THEN THE APPROPRIATE
                  VALUE OR VALUES SHOULD BE REPLACED WITH A -999.0.
                  IF THE ARGUMENT TD IS MISSING THEN THE VALUE
                  -999.0 SHOULD BE USED IN PLACE OF THE MISSING ARGUMENT.
                  THE CURRENT GLOBAL IRRADIANCE (G(2)) MUST HAVE A
                  VALUE. IF THE DEW POINT TEMPERATURE (TD) IS MISSING
                  THEN ID IS NOT USED TO FIND AN INDEX INTO THE
                  CORRECTION MATRIX (CM), INSTEAD A SPECIAL COLUMN IN
                  THE MATRIX IS USEDD. IF THE PREVIOUS GLOBAL
                  IRRADIANCE (G(1)) OR SOLAR ZENITH ANGLE (Z(1)) AND
                  THE NEXT GLOBAL IRRADIANCE (G(3)) OR SOLAR ZENITH ANGLE
                  (Z(3)) ARE MISSING THEN DELTA KT' (DTK1) IS NOT USED TO
                  FIND AN INDEX INTO THE CORRECTION MATRIX (CM), INSTEAD
                  A SPECIAL COLUMN IN THE MATRIX IS USED.
HISTORY
      6/26/91: Richard perez: Midification of DKT1 calculation
               to avoid very low sum distorion caused by questionable
               cosine response of pryanometers
7/5/91:  RS: lines extending beyond col 72 fixed.
 Questionable use of x**-y changed to x**(-y)
 Made reference to intrinsic dmax1 agree with type
</PRE>