

#!/bin/bash



# Specify the drive letter to check (e.g. C: or D:)

drive_letter=${DRIVE_LETTER}



# Run chkdsk command with /f and /r options to fix errors and locate bad sectors

chkdsk ${DRIVE_LETTER} /f /r



# Check the exit code of the previous command to see if any errors were fixed

if [ "$?" -eq 0 ]; then

  echo "Drive ${DRIVE_LETTER} checked and fixed successfully."

else

  echo "Error: Drive ${DRIVE_LETTER} check failed."

fi