@echo off
title Build Script Menu

:menu
cls
echo Choose a generator:
echo 1. MinGW
echo 2. VS2019
echo 3. Anything else
echo 4. Exit

set /p choice="Enter your choice: "

if "%choice%"=="1" (
    call :build "mingw"
) else if "%choice%"=="2" (
    call :build "vs"
) else if "%choice%"=="3" (
    set /p b-type="Can you describe the type please?:"
    call :build-altern %b-type%
) else if "%choice%"=="4" (
    exit 
) else (
    echo Invalid choice. Please try again.
    pause
    goto :menu
)

exit /b

:build
mkdir "build-%~1" 2>nul
cd "build-%~1"
if %~1=="mingw"(
    cmake .. -G "MinGW Makefiles"
) else if %~1=="vs" (
    cmake .. -G "Visual Studio 2019"
)


:build-altern
mkdir "build" 2> nul
cd build
cmake .. -G %~1
