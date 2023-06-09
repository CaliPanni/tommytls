@echo off
:u
cls
title wiko tommy tools 1.0
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
echo Please connect your device and enable USB debugging, then click Enter.
pause>NUL
:s
cls
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
set /p r=Want to unlock bootloader? (y, n)
if %r% == y goto a
if %r% == n goto b
goto s
:b
:s
cls
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
set /p r=Want to install twrp? (y, n)
if %r% == y goto twrp
if %r% == n exit
goto s
cls 
:a
cls
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
color c
set /p m=If you unlock the bootloader you will lose ALL your data, do you want to continue anyway? (y, n)
if %m% == y goto h
if %m% == n goto e
goto a
:e
msg %username% All operations have been canceled.
exit
:h
cls
color 2
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
echo                    (DON'T DISCONNECT YOUR DEVICE)
echo.
echo                          Restarting in fastboot...
echo LOG:
start /B /WAIT adb.exe restart bootloader
cls
echo press enter to continue
pause>nul
cls
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
echo                    (DON'T DISCONNECT YOUR DEVICE)
echo.
echo                          unlocking bootloader...
echo LOG:
start  /B /WAIT fastboot.exe oem unlock-go
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
echo                    Bootloader unlocked!
echo.
echo Press Enter to return to the main menu.
pause>NUL
goto u
:twrp
cls
color 6
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
echo                    (DON'T DISCONNECT YOUR DEVICE)
echo.
echo                          flashing twrp...
echo LOG:
start /B /WAIT adb.exe reboot bootloader
start /B /WAIT fastboot.exe flash recovery recovery.img
cls
color 4 
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
echo NOW HOLD DOWN VOLUME UP AND CLICK ENTER! 
echo.
echo After the device is turned off, access the recovery.
echo.
echo LOG:
pause>NUL
start /B /WAIT fastboot.exe reboot-bootloader
cls
color 2
echo.
echo.
echo ------------------------WIKO TOMMY TOOLS------------------------
echo.
echo.
echo                    TWRP flashed!
echo.
echo Press Enter to return to the main menu.
pause>NUL
goto u