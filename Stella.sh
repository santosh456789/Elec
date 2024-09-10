#!/bin/bash

APP_COMMAND="/userdata/apps/Electrace/./Electrace"  # Replace with your application command
GDB_LOG="/userdata/apps/Electrace/bt_log.log"     # Replace with the path to your GDB log file
RSET_SOFT = "tx reset software"

date="date"
while true; do
    # Run GDB with the command script
   # gdb -batch -ex "run" -ex "set logging file $GDB_LOG" -ex "set logging  on" -ex "bt full" -ex "set logging  off" -ex "quit" --args $APP_COMMAND
	$APP_COMMAND
    # Check the exit status of GDB
    if [ $? -eq 0 ]; then
        echo "=================================crash occured so exited on $date  ========================" >> $GDB_LOG
        $date >> $GDB_LOG
        echo "=================================crash occured so exited on $date  ========================" >> $GDB_LOG
        $RSET_SOFT
        # exit
        
    else
        echo "=================================crash occured so exited on $date  ========================" >> $GDB_LOG
        $date >> $GDB_LOG
        echo "=================================crash occured so exited on $date  ========================" >> $GDB_LOG
        $RSET_SOFT
        # exit
    fi
    # Optional: Add a delay before restarting the application
    sleep 1
done
