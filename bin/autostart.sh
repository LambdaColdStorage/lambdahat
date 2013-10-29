#!/bin/bash
#
#	autostart.sh
#	=========
#	Tell the hat to automatically start mindcap on boot.
#
#	:created: 2013-10-22 10:58:09 -0700
#	:copyright: (c) 2013, Lambda Labs, Inc.
#	:license: All Rights Reserved.
#
TMPFILE=/tmp/autostart.$$
AUTOSTART_LOCATION=/data/local/userinit.sh
cat > $TMPFILE <<"EOF"
#!/bin/bash
# Autostart mindcap
LOGFILE=/data/local/mindcap.log
su -c "kill -9 $(ps | grep com.lambdal.mindcap | awk '{ print $2 }')"
am start -a android.intent.action.MAIN -n $APP_PACKAGE/.MindCap
echo "Started MindCap on: $(date)" >> $LOGFILE
EOF
adb push $TMPFILE $AUTOSTART_LOCATION"
