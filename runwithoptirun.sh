#!/usr/bin/env bash
logfile='/tmp/runwithoptirun.log'
###
CPWD=$PWD

APP=$1
APP_PATH=$(dirname "${APP}")
APP_FILE=$(basename "${APP}")

if [[ "${APP_FILE}" =~ ".desktop" ]]; then
	APP_EXEC=`grep Exec ${APP} | cut -d "=" -f2 | tr -d \"`
	APP_PATH=`grep Path ${APP} | cut -d "=" -f2 | tr -d \"`
#	echo "Got Path:${APP_PATH} Exec:${APP_EXEC} from ${APP_FILE}" >> $logfile
        APP_FILE=$(basename "${APP_EXEC}")
fi

cd "${APP_PATH}"

#echo `pwd`
optirun ./${APP_FILE} >> $logfile 2>&1 

cd "${CPWD}"
