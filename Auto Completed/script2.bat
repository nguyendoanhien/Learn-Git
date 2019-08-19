@echo off
set pathInit=D:\Hien\Study2\

setlocal ENABLEDELAYEDEXPANSION
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
for /f "tokens=*" %%a in (auto.txt) do (
    set pathz=%%a

    echo %%a|find "/" >nul
    if errorlevel 1 (
    echo ____________________________


   echo %pathInit%!pathz!
  echo.
  echo.
    call :innerForInit "!pathz!"
    call :innerFor "!pathInit!!pathz!"

    )

)

:CONTINUE
rem
exit /B

:innerForInit
    if not exist %pathInit%%~1 (mkdir %pathInit%%~1)
    cd %pathInit%%~1
    if exist .git/index.lock (del -f .git/index.lock)
    if not exist %pathInit%%~1\.git (git init)


    git remote add origin https://github.com/nguyendoanhien/%~1
 exit /b 0

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