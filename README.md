# zipcode
The zipcode.sh script takes three possible flags:

 > - $ ./zipcode.sh -h
 > -Usage: zipcode.sh
 > -
 > -  -c      CITY    Which city to search
 > -  -s      STATE   Which state to search (Indiana)
 > -
 > -If no CITY is specified, then all the zip codes for the STATE are displayed.

The -c flag takes a CITY argument, which specifies the city to search for within the STATE. If no CITY is specified, then the script should return all the zip codes in the STATE.

The -s flag takes a STATE argument, which specifies the STATE to search through. If no STATE is specified, then the script should assume the STATE is "Indiana".
