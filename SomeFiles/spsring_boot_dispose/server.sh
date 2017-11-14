#!/bin/bash   
source config.ini
cygwin=false
darwin=false
os400=false
case "`uname`" in
CYGWIN*) cygwin=true;;
Darwin*) darwin=true;;
OS400*) os400=true;;
esac
SERVER=`pwd`
location="--spring.config.location="$springresources
case "$1" in   
  
  start)
  nohup java $JAVA_OPTIONS -jar $JAR_NAME  --spring.config.location=$RESOURCES > $SERVERLOG 2>&1 &  
  echo $! > $SERVER/server.pid   
    ;;   
  
  stop)   
    kill `cat $SERVER/server.pid`   
    rm -rf $SERVER/server.pid   
    ;;   
  
  restart)   
    $0 stop   
    sleep 1   
    $0 start   
    ;;   
  
  *)   
    echo "Usage: run.sh {start|stop|restart}"  
    ;;   
  
esac   
  
exit 0  
