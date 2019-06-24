@echo off
cd "%~1"
if exist .git/index.lock (del -f .git/index.lock)
  git pull origin master 
  git add . 
  git commit -a -m "update" 
  git push -u origin master