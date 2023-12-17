@echo off
if "%CD:~-6%" neq "assets" (
goto notassets
)
color 2f
echo.
echo. Smash Hit assets .mp3 extension correction tool v1.01 - Made by: Happy_mimimix
echo.
echo.
echo.    Please select working mode: 
echo.
echo.      1. Remove .mp3 extension (prepare files for editing)
echo.
echo.      2. Restore original (prepare files for compiling)
echo.
CHOICE /C 12 /N /M ">"
@echo on
if %errorlevel% equ 1 (goto remove)
if %errorlevel% equ 2 (goto add)
:remove
for /r %%i in (*.mp3) do (
set name=%%~i
call :sub1
)
mshta vbscript:msgbox("Task completed! ",48,"Info")(window.close)
exit
:sub1
if /i "%name:~-4%" equ ".mp3" (
move "%name%" "%name:~0,-4%"
)
exit /b
:add
for /r %%i in (*.*) do (
set name=%%~i
call :sub2
)
mshta vbscript:msgbox("Task completed! ",48,"Info")(window.close)
exit
:sub2
if /i "%name:~-4%" neq ".cmd" (
if /i "%name:~-4%" neq ".mp3" (
move "%name%" "%name%.mp3"
)
)
exit /b
:notassets
mshta vbscript:msgbox("Please drag me into the assets folder of Smash Hit and run. ",48,"Info")(window.close)
exit