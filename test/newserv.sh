SERVICE=$1

ps -a | grep -v grep | grep $1 > /dev/null
result=$?
echo "exit code: ${result}"
if [ "${result}" -eq "0" ] ; then
    echo "`date`: $SERVICE service running, everything is fine"
else
    echo "`date`: $SERVICE is not running"
fi
