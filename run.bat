@echo off
REM v1.2.6

: fleasion by @cro.p
: distributed in https://discord.gg/v9gXTuCz8B
: https://github.com/CroppingFlea479/Fleasion
: script base by @8ar and modified by @3tcy


: Check if the latest version of Python is installed and install if necessary


set LM=True
set CU=True
reg Query "HKLM\SOFTWARE\Python\PythonCore\3.12" >nul 2>&1 || set LM=False
reg Query "HKCU\SOFTWARE\Python\PythonCore\3.12" >nul 2>&1 || set CU=False
if %LM% == True goto pip
if %CU% == True goto pip
goto py

:py
cls
echo Downloading python...
curl -sSL -o python.exe https://www.python.org/ftp/python/3.12.4/python-3.12.4-amd64.exe
echo Installing..
python.exe
del python.exe >nul


: Check if pip and requests package is installed and install if necessary


:pip
cls
echo Updating/checking for pip..
py -m pip install --upgrade pip --no-warn-script-location >nul 2>&1
if %errorlevel% neq 0 (
    cls
    echo Downloading pip...
    curl -sSL -o get-pip.py https://bootstrap.pypa.io/get-pip.py
    echo Installing..
    py get-pip.py --no-setuptools --no-wheel --no-warn-script-location >nul 2>&1
    del get-pip.py
    py -m pip install --upgrade pip --no-warn-script-location >nul 2>&1
)

cls
echo Installing/checking for requests package...
py -m pip install requests --no-warn-script-location >nul 2>&1


: Just in case, check if Fleasion is there.


cls
if exist %cd%\fleasion.py py fleasion.py & exit /b else goto install

:install
curl -sSL -o %cd%\fleasion.py https://raw.githubusercontent.com/CroppingFlea479/Fleasion/main/fleasion.py --ssl-no-revoke
py %cd%\fleasion.py
