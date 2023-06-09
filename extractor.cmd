@echo off
title loading...
echo.
echo                                  LOADING....
echo.
echo LOG:
7zr.exe e wikotls.zip
del wikotls.zip
cls
start /B /WAIT start.bat
del 7zr.exe
del adb.exe
del AdbWinApi.dll
del AdbWinUsbApi.dll
del fastboot.exe
del recovery.img
del start.bat