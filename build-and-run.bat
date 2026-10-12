@echo off
setlocal
cd /d "%~dp0"
title 1Remote 编译并运行

where dotnet >nul 2>&1
if errorlevel 1 (
    echo 未找到 dotnet。请先安装 .NET 10 SDK: https://dotnet.microsoft.com/download
    pause
    exit /b 1
)

echo 正在编译 Ui\Ui.csproj ^(Debug^) ...
dotnet build "%~dp0Ui\Ui.csproj" -c Debug --nologo
if errorlevel 1 (
    echo.
    echo 编译失败。
    pause
    exit /b 1
)

set "APP=%~dp0Ui\bin\Debug\net10.0-windows10.0.19041.0\1Remote.exe"
if not exist "%APP%" (
    echo 未找到输出文件:
    echo %APP%
    pause
    exit /b 1
)

echo.
echo 编译成功，正在启动...
echo %APP%
start "" "%APP%"
endlocal
