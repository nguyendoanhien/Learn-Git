@echo off
setlocal ENABLEDELAYEDEXPANSION
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
for /f "tokens=*" %%a in (auto.txt) do (
  echo ____________________________
  set pathz=%%a
   echo !pathz!
  echo.
  echo.

	  call :innerFor "!pathz!"
  
  
  
)
:innerFor
     echo "D:\Hien\Study\%~1"
     mkdir "D:\Hien\Study\%~1"
     cd "D:\Hien\Study\%~1"
	if exist .git/index.lock (del -f .git/index.lock)
	  git init
	  git remote add origin https://github.com/nguyendoanhien/%~1
 exit /b 0

pause
exit