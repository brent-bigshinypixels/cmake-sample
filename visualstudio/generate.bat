@echo off
setlocal 

cd /D "%~dp0"

where /q cmake.exe
if %ERRORLEVEL% NEQ 0 (
    echo Error: cmake.exe was not found in the PATH environment variable. Ensure CMake is installed and added to your PATH.
    endlocal
    exit /b 1
)

set CMAKE_GENERATOR=Visual Studio 17 2022
:: set PROCESSOR_ARCHITECTURE=x64
set PROCESSOR_ARCHITECTURE=arm64
set VS_PROJECT_OUTPUT_DIRECTORY=../visualstudio/_generated/
set CMAKE_PROJECT_ROOT_DIRECTORY=../source/

cd %CMAKE_PROJECT_ROOT_DIRECTORY%
"cmake.exe" -G "%CMAKE_GENERATOR%" ^
    -A %PROCESSOR_ARCHITECTURE% ^
	-B "%VS_PROJECT_OUTPUT_DIRECTORY%" 2>&1 

endlocal
exit /b %ERRORLEVEL%
