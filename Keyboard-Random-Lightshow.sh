#!/bin/bash

#COPYRIGHTS
 clear
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""
 echo "░░░░░██╗░█████╗░██████╗░██████╗░░█████╗░██████╗░"
 echo "░░░░░██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗"
 echo "░░░░░██║███████║██████╔╝██████╔╝███████║██████╔╝"
 echo "██╗░░██║██╔══██║██╔══██╗██╔══██╗██╔══██║██╔══██╗"
 echo "╚█████╔╝██║░░██║██║░░██║██║░░██║██║░░██║██║░░██║"
 echo "░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝"
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""
 echo ""


# Humm
KBD="/sys/class/leds/tpacpi::kbd_backlight/brightness"
POWER="/sys/class/leds/tpacpi::power/brightness"
MUTE="/sys/class/leds/platform::mute/brightness"
MUTEMIC="/sys/class/leds/platform::micmute/brightness"

# SETTINGS PERMISSIONS
sudo chmod g+x $KBD && sudo chmod u+x $KBD && sudo chown root $KBD && sudo chown lenovo $KBD
sudo chmod g+x $POWER && sudo chmod u+x $POWER && sudo chown root $POWER && sudo chown lenovo $POWER
sudo chmod g+x $MUTE && sudo chmod u+x $MUTE && sudo chown root $MUTE && sudo chown lenovo $MUTE
sudo chmod g+x $MUTEMIC && sudo chmod u+x $MUTEMIC && sudo chown root $MUTEMIC && sudo chown lenovo $MUTEMIC

# SAVING DEFAULT VALUES
DEFAULTKBD="$(cat $KBD)"
DEFAULTPOWER="$(cat $POWER)"
DEFAULTMUTE="$(cat $MUTE)"
DEFAULTMUTEMIC="$(cat $MUTEMIC)"

# CHECK ARGUMENT 1 VALUE ( ITERATIONS )
if [ -z "$1" ] 
then
   MAXLIMIT=100
else 
   MAXLIMIT=$1 
fi  

# CHECK ARGUMENT 2 VALUE ( DELAY )
if [ -z "$2" ] 
then
   DELAYAMOUNT=.5
else 
   DELAYAMOUNT=$2 
fi  


# CORE
for i in $( eval echo {0..$MAXLIMIT} )
do  
   echo $(( $RANDOM % 3 )) > $KBD
   echo $(( $RANDOM % 3 )) > $POWER
   echo $(( $RANDOM % 3 )) > $MUTE
   echo $(( $RANDOM % 3 )) > $MUTEMIC
   sleep $DELAYAMOUNT
done



# RESET EVERYTHING TO DEFAULT
   echo $DEFAULTKBD > $KBD
   echo $DEFAULTPOWER > $POWER
   echo $DEFAULTMUTE > $MUTE
   echo $DEFAULTMUTEMIC > $MUTEMIC
