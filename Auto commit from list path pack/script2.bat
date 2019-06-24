@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

for /f "tokens=*" %%a in (auto.txt) do (
  echo.
  echo.
  echo Path=%%a
  cd %%a
if exist .git/index.lock (del -f .git/index.lock)
  git pull origin master 
  git add . 
  git commit -a -m "update" 
  git push -u origin master
)
exit