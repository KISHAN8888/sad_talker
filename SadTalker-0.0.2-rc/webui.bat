@echo off

:: Remove existing venv if it exists
IF EXIST venv (
    echo Removing existing venv...
    rmdir /s /q venv
)

echo Creating new venv...
::python -m venv venv
py -3.10 -m venv venv 
call .\venv\Scripts\activate.bat

set PYTHON="venv\Scripts\Python.exe"
echo venv %PYTHON%

:: Update pip first
%PYTHON% -m pip install --upgrade pip

echo Installing Gradio...
%PYTHON% -m pip install gradio==3.14.0

:: Install specific PyTorch version required by SadTalker
%PYTHON% -m pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113

:: Install specific Gradio version
%PYTHON% -m pip install gradio==3.14.0

%PYTHON% Launcher.py

IF %ERRORLEVEL% NEQ 0 (
    echo.
    echo Launch unsuccessful. Please check the error messages above.
    pause
)
