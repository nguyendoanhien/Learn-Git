@echo off
for /f "tokens=*" %%a in (auto.txt) do (
  echo.
  echo.
  echo Path=%%a
  cd %%a && git add-commit
)
pause