@echo off

REM Check if the line is already present in the index.html file
findstr /C:"<link rel=\"icon\" href=\"favicon.ico\" type=\"image/x-icon\"/>" index.html >nul

REM If the line is not found, add it after the <meta charset="utf-8"/> line
if %errorlevel% neq 0 (
    echo Adding missing line to index.html...
    (for /f "tokens=*" %%i in (index.html) do (
        echo %%i
        if "%%i"=="    <meta charset=""utf-8""/>" echo     ^<link rel="icon" href="favicon.ico" type="image/x-icon"/^>
    )) > index_temp.html
    move /Y index_temp.html index.html
)

REM Continue with existing git commands
clear
git status
git add *
git commit -m "..."
git push origin main