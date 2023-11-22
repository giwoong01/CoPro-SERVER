#!/usr/bin/env bash

PROJECT_ROOT="/home/ubuntu/app"
JAR_FILE="/home/ubuntu/co-pro-0.0.1-SNAPSHOT.jar"

APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/error.log"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

# build 파일 복사
echo "$TIME_NOW > $JAR_FILE 파일 복사" >> $DEPLOY_LOG
cp $PROJECT_ROOT/build/libs/*.jar /home/ubuntu/

# jar 파일 실행
echo "$TIME_NOW > $JAR_FILE 파일 실행" >> $DEPLOY_LOG
cd /home/ubuntu && nohup java -jar $JAR_FILE > /dev/null 2> /dev/null < /dev/null &

CURRENT_PID=$(pgrep -f $JAR_FILE)
echo "$TIME_NOW > 실행된 프로세스 아이디 $CURRENT_PID 입니다." >> $DEPLOY_LOG
