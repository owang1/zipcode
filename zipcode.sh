#!/bin/sh

# Functions

usage() {
    cat <<EOF
Usage: zipcode.sh

  -c      CITY    Which city to search
  -s      STATE   Which state to search (Indiana)

If no CITY is specified, then all the zip codes for the STATE are displayed.
EOF
    exit $1

}

# Parse command-line options

URL=http://www.zipcodestogo.com/
STATE="Indiana"
searchCity=false
while [ $# -gt 0  ]; do
    case "$1" in
	-h)
	usage 0		# Usage statement
	exit 1
	;;
	-c)		# City
	 shift
	     searchCity=true
	     CITY="$1"
	     ;;
	-s) 
	     shift
	     STATE="$1"
	     ;;
    esac
    shift
done

# Filter pipeline(s)

# convert " " to %20 for STATE
STATE=$(echo $STATE | sed 's/ /%20/g')

# grep pipelines to search for and return zipcodes
if [ searchCity ]; then
curl -v --silent $(echo $URL$STATE/) 2>&1 | grep -oP "(?<=$CITY/[A-Z][A-Z]/)[0-9]{5}"
else
curl -v --silent $(echo $URL$STATE/) 2>&1 | grep -oP '(?<=>)[0-9]{5}(?=<)'
fi
