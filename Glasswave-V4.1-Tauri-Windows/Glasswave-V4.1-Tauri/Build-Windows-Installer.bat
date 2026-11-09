@echo off
cd /d "%~dp0"
echo Installing project packages...
call npm install
if errorlevel 1 goto error
echo Building Glasswave Windows installer...
call npm run tauri build
if errorlevel 1 goto error
echo.
echo Build complete. Look in src-tauri\target\release\bundle\nsis\
 pause
exit /b 0
:error
echo.
echo Build failed. Check the error above and the README prerequisites.
pause
exit /b 1
