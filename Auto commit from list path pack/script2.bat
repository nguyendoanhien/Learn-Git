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
     cd "%~1"
	if exist .git/index.lock (del -f .git/index.lock)
	  git pull origin master 
	  git add . 
	  git commit -a -m "update" 
	  git push -u origin master
 exit /b 0

pause
exit