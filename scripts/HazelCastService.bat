@Echo OFF

set SERVICE_NAME=Hazelcast
set PR_DISPLAYNAME=Hazelcast Service

REM Change this to the Path Where the Exe is Located in different Environments
set PR_INSTALL="\Aravind\HazelCast\hazelcast-3.8\lib\hazelcastinstallsvc.exe"

REM Service log configuration
set PR_LOGPREFIX=hazelcast

REM Choose the Log Location based on HazelCast Location
set PR_LOGPATH=\Aravind\HazelCast\hazelcast-3.8\logs
set PR_STDOUTPUT=%PR_LOGPATH%\hazelcast.log
set PR_STDERROR=%PR_LOGPATH%\hazelcast.log
set PR_LOGLEVEL=INFO

REM Path to java installation - Make sure this is in accordance to java that is set in the Path for windows.
set PR_JVM=C:\Program Files\Java\jdk1.7.0_85\jre\bin\server\jvm.dll

REM this jar is supposed to be located in the prunsrv.exe directory
set PR_CLASSPATH=hazelcast-all-3.8.jar;HazelCastService-1.0.jar;log4j-1.2.16.jar

REM Startup configuration
set PR_STARTUP=auto
set PR_STARTMODE=jvm
set PR_STARTCLASS=com.aravind.service.HazelCastService
set PR_STARTMETHOD=start

REM - Update with Hazelcast Configuration Location here.
set PR_STARTPARAMS=\Aravind\HazelCast\hazelcast-3.8\bin\hazelcast.xml

REM Shutdown configuration
set PR_STOPMODE=jvm
set PR_STOPCLASS=com.aravind.service.HazelCastService
set PR_STOPMETHOD=stop

REM JVM configuration
set PR_JVMMS=256
set PR_JVMMX=512
set PR_JVMSS=256
set PR_JVMOPTIONS=-Dhazelcast.logging.type=log4j;-Dhazelcast.jmx=true;-Dcom.sun.management.jmxremote.port=9001;-Dcom.sun.management.jmxremote.authenticate=false;-Dcom.sun.management.jmxremote.ssl=false

REM Install service
hazelcastinstallsvc.exe //IS//%SERVICE_NAME%

@Echo On
