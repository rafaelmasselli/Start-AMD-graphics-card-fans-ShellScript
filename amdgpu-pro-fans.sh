#!/usr/bin/env bash

# COMMAND PARSED VARIABLES 
adapter="all"
targettemp=""
fanpercent=""
arguments="$@"

# USAGE FUNCTION 
usage ()
{
    echo "* AMDGPU-PRO-FANS *"
    echo "error: invalid arguments"
    echo "usage: $0 [-h] for help..."
    exit
}


# SET FAN SPEED FUNCTIONS 
set_all_fan_speeds ()
{
    cardcount="0";
    for CurrentCard in  /sys/class/drm/card?/ ; do
         for CurrentMonitor in "$CurrentCard"device/hwmon/hwmon?/ ; do
              cd $CurrentMonitor
              workingdir="`pwd`"
              fanmax=$(head -1 "$workingdir"/pwm1_max)
              if [ $fanmax -gt 0 ] ; then    
                  speed=$(( fanmax * fanpercent ))
                  speed=$(( speed / 100 ))
                  sudo chown $USER "$workingdir"/pwm1_enable
                  sudo chown $USER "$workingdir"/pwm1
                  sudo echo -n "1" >> $workingdir/pwm1_enable
                  sudo echo -n "$speed" >> $workingdir/pwm1 
                  speedresults=$(head -1 "$workingdir"/pwm1)
                  if [ $(( speedresults - speed )) -gt 6 ] ; then
                       echo "Error Setting Speed For Card$cardcount!"
                  else
                       echo "Card$cardcount Speed Set To $fanpercent %"
                  fi
              else
                  echo "Error: Unable To Determine Maximum Fan Speed For Card$cardcount!"
              fi
         done
         cardcount="$(($cardcount + 1))"
    done
}

set_fans_requested ()
{
    if [ "$adapter"="all" ] ; then
        set_all_fan_speeds
    fi
}



# PARSE COMMAND LINE PARAMETERS 
command_line_parser ()
{
     parseline=`getopt -s bash -u -o a:s: -n '$0' -- "$arguments"` 
     eval set -- "$parseline"
     while true ; do
        case "$1" in
            -a ) adapter="$2" ; shift 2 ;;
            -s ) fanpercent="$2" ; set_fans_requested ; break ;;
            --)  break ;;
            *) usage ; exit 1 ;;
        esac    
    done
}


# Home Function 
command_line_parser
exit;
