@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
color 1
title Roku Menu

set rMAC=08-c3-b3-dd-c6-81

for /f "tokens=1 delims=: " %%i in ('arp -a ^| findstr /R /C:"%rMAC%"') do set rIP=%%i:8060

:MENU
cls
ECHO     _/_/_/              _/                  
ECHO    _/    _/    _/_/    _/  _/    _/    _/   
ECHO   _/_/_/    _/    _/  _/_/      _/    _/    
ECHO  _/    _/  _/    _/  _/  _/    _/    _/     
ECHO _/    _/    _/_/    _/    _/    _/_/_/  
ECHO #########################################
ECHO # Please select an option from the menu #
ECHO #########################################
ECHO ###############################
ECHO # 1 - Turn on Roku Monitor    #
ECHO # 2 - Turn on Roku RPI        #
ECHO # 3 - Turn off Roku           #
ECHO # 4 - Open Netflix            #
ECHO # 5 - Open HBO                #
ECHO # 6 - Open Hulu               #
ECHO # 7 - Select Button           #
ECHO ###############################

SET /P M="Choose an option:"
IF %M%==1 GOTO PC
IF %M%==2 GOTO RPI
IF %M%==3 GOTO OFF
IF %M%==4 GOTO NF
IF %M%==5 GOTO HBO
IF %M%==6 GOTO HULU
IF %M%==7 GOTO SELECT 
IF %M%==8 GOTO SWITCH 


:PC
 curl -d '' "http://%rIP%/launch/tvinput.hdmi1" 
GOTO MENU
:RPI
 curl -d '' "http://%rIP%/launch/tvinput.hdmi2" 
GOTO MENU
:OFF
 curl -d '' "http://%rIP%/keypress/PowerOff"
GOTO MENU
:NF
 curl -d '' "http://%rIP%/keypress/PowerOn"
 curl -d '' "http://%rIP%/launch/12" 
GOTO MENU
:HBO
 curl -d '' "http://%rIP%/keypress/PowerOn"
 curl -d '' "http://%rIP%/launch/61322" 
GOTO MENU
:HULU
 curl -d '' "http://%rIP%/keypress/PowerOn"
 curl -d '' "http://%rIP%/launch/2285" 
GOTO MENU
:SELECT
 curl -d '' "http://%rIP%/keypress/Select"
GOTO MENU
:SWITCH
 curl -d '' "http://%rIP%/keypress/PowerOn"
 curl -d '' "http://%rIP%/launch/tvinput.hdmi3" 
GOTO MENU
