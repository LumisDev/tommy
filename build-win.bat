@echo off
title Build Script Menu

:menu
cls
echo Choose a generator:
echo 1. MinGW
echo 2. VS2019
echo 3. Exit

set /p choice="Enter your choice: "

if "%choice%"=="1" (
    call :build "mingw" "MinGW Makefiles"
) elseif "%choice%"=="2" (
    call :build "vs" "Visual Studio 2019"
) elseif "%choice%"=="3" (
    exit
) else (
    echo Invalid choice. Please try again.
    pause
    goto :menu
)

exit /b

:build
mkdir "build-%~1" 2>nul
cd "build-%~1" || exit /b
cmake .. -G %~2
