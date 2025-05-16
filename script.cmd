@echo off 
title shows_wifi_passwords_madeby__@F9
chcp 65001 >nul
cls
echo.
pause



__author__@F9
__description__this script shows wifi passwords and lan passwords
__version__1.0
__date__2025-05-16






:home
color 0a
echo.
echo. ┬ ┬┬┌─┐┬  ┬┌┐┌┌┬┐┌─┐┬─┐┌─┐┌─┐┌─┐┌─┐
echo. ││││├┤ │  ││││ │ ├┤ ├┬┘├┤ ├─┤│  ├┤ 
echo. └┴┘┴└  ┴  ┴┘└┘ ┴ └─┘┴└─└  ┴ ┴└─┘└─┘
echo.
echo.{1} wifi passwords 
echo.{2} lan passwords
echo.{3} exit
pause 
cls

set /p choice=Enter your choice (1-3):: 

if "%choice%"=="1" (
    for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
        set "profile=%%a"
        call :showpass "%%a"
    )
    pause
    goto home
) else if "%choice%"=="2" (
    echo LAN Profiles:
    for /f "tokens=2 delims=:" %%a in ('netsh lan show profiles ^| findstr "All User Profile"') do (
        set "lanprofile=%%a"
        call :showlan "%%a"
    )
    pause
    goto home
) else if "%choice%"=="3" (
    exit
) else (
    echo Invalid choice.
)

goto :eof

:showpass
setlocal enabledelayedexpansion
set "profile=%~1"
set "profile=!profile:~1!"
echo ====== !profile! ======
for /f "tokens=2 delims=:" %%k in ('netsh wlan show profile name^="!profile!" key^=clear ^| findstr "Key Content"') do (
    echo Password:%%k
)
endlocal

:showlan
setlocal enabledelayedexpansion
set "lanprofile=%~1"
set "lanprofile=!lanprofile:~1!"
echo ====== !lanprofile! ======
netsh lan show profile name="!lanprofile!" key=clear | findstr "Key Content"
endlocal
